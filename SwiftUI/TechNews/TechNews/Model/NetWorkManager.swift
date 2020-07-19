//
//  NetWorkManager.swift
//  TechNews
//
//  Created by DAPL-Asset-290 on 29/06/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import Foundation

class NetWorkManager : ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchNews(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                           let result = try decoder.decode(Result.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = result.hits
                                print(self.posts)
                            }
                            
                        }
                        catch{
                            print("Error :",error.localizedDescription )
                        }
                    }
                }
                else{
                    print(error?.localizedDescription ?? "")
                }
            }
            task.resume()
        }
    }
}
