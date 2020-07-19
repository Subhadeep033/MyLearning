//
//  WeatherManager.swift
//  Clima
//
//  Created by DAPL-Asset-290 on 18/06/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weather : WeatherModel)
    func didFailWithError(_ error : Error)
}
struct WeatherManager {
    let apiKey = "fde3882693a31eb1a0d04d1d7f66fd19"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=fde3882693a31eb1a0d04d1d7f66fd19&units=metric"
    
    var delegate : WeatherManagerDelegate?
    
    func getWeather(withLatitude : Double, andLongitude : Double){
       let urlStr = "\(weatherURL)&lat=\(withLatitude)&lon=\(andLongitude)"
        print(urlStr)
        getWeather(urlStr)
    }
    
    func getWeather(cityName : String){
        let urlStr = "\(weatherURL)&q=\(cityName)"
        print(urlStr)
        getWeather(urlStr)
    }
        
    func getWeather(_ url : String){
        // 1. Create Url...
        if let weatherUrl = URL(string: url){
            
            // 2. Create URL Session...
            let session = URLSession(configuration: .default)
            
            // 3. Assign a Task...
            //let task = session.dataTask(with: weatherUrl, completionHandler: handleResponse(data:response:error:))
            let task = session.dataTask(with: weatherUrl) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let responseData = data {
                    if let weatherDetails = self.parseJsonData(data: responseData){
                        self.delegate?.didUpdateWeather( weatherDetails)
                    }
                }
            }
            
            // 4. Start Task...
            task.resume()
        }
    }
    
    func parseJsonData(data : Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: data)
            
            let name = decodedData.name ?? ""
            let temp = decodedData.main?.temp ?? 0.0
            let details = decodedData.weather?[0].weatherDescription ?? ""
            let conditionId = decodedData.weather?[0].id ?? 0
            
            let weather = WeatherModel(conditionId: conditionId, description: details, temparature: temp, cityName: name)
            
            return weather
        }
        catch{
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
    
    
}
