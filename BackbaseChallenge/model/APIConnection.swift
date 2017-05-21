//
//  APIConnection.swift
//  Challenge
//
//  Created by Camilo Medina on 5/20/17.
//  Copyright © 2017 Camilo Medina. All rights reserved.
//

import Foundation
import MapKit

class APIConnection {
    
    public enum ResponseStatus {
        case error(String)
        case success(Any)
    }
    
    let API_URL = "http://api.openweathermap.org/data/2.5/weather?"
    let API_KEY = "c6e381d8c7ff98f0fee43775817cf6ad"
    
    func fetchForecastAtLocation(_ location: CLLocationCoordinate2D, handler: @escaping (ResponseStatus) -> ()) {
        let urlRequest = API_URL + "lat=\(location.latitude)&lon=\(location.longitude)&appid=\(API_KEY)&units=metric"
        var request = URLRequest(url: URL(string: urlRequest)!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with: request) {data, response, err in
            print("Data: \(String(describing: data)), response: \(String(describing: response)), error: \(String(describing: err))")
            if let _ = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    handler(.success(jsonData))
                } catch {
                    handler(.error(String(describing: error)))
                }
                
            } else if let _ = err {
                handler(.error(String(describing: err!)))
            }
            
        }.resume()
    }
}
