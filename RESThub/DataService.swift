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
    
    //@escaping to allowed to execute after the method returns
    func fetchGists(completion: @escaping (Result<Any, Error>) -> Void) {
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
                completion(.failure(error!))
                //print("API error :\(error!.localizedDescription)")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: validData, options: [])
                completion(.success(json))
                //print(json)
            } catch let serializationError {
                completion(.failure(serializationError))
                //print(serializationError.localizedDescription)
            }
            
            }.resume()
    }
}
