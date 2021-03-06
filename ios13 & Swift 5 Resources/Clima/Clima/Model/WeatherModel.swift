//
//  WeatherModel.swift
//  Clima
//
//  Created by DAPL-Asset-290 on 19/06/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId : Int
    let description : String
    let temparature : Double
    let cityName : String
    
    var tempStr : String {
        return String(format: "%.1f", temparature)
    }
    
    var conditionType : String {
        switch conditionId {
            case 200...232:
                return "cloud.bolt.rain"
            case 300...321:
                return "cloud.drizzle"
            case 500...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 701...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud.bolt"
            default:
                return "cloud"
        }
    }
}
