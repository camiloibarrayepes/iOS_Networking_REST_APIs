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
        componentURL.path = "/somePath"
        
        //print(baseURL)
        //print(compusedURL?.absoluteString ?? "Relative URL failed...")
        print(componentURL.url! )
    }
}
