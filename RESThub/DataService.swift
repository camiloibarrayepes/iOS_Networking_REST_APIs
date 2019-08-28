//
//  DataService.swift
//  RESThub
//
//  Created by camilo andres ibarra yepes on 8/28/19.
//  Copyright © 2019 Harrison. All rights reserved.
//

import Foundation

class DataService {
    //(1*) static let shared = DataService()
    static let shared = DataService()
    fileprivate let baseURLString = "https://api.github.com"
    
    func fetchGists() {
        //var baseURL = URL(string: baseURLString)
        //baseURL?.appendPathComponent("/somePath")
        //let compusedURL = URL(string: "/somePath", relativeTo: baseURL)
        var componentURL = URLComponents()
        componentURL.scheme = "https"
        componentURL.host = "api.github.com"
        componentURL.path = "/gists/public"
        
        guard let validURL = componentURL.url else {
            print("URL Creation failed")
            return
        }
        
        URLSession.shared.dataTask(with: validURL) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("API status: \(httpResponse.statusCode)")
            }
            
            guard let validData = data, error == nil else {
                print("API error :\(error!.localizedDescription)")
                return
            }
            
            }.resume()
    }
}
