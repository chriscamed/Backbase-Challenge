//
//  APIConnection.swift
//  Challenge
//
//  Created by Camilo Medina on 5/20/17.
//  Copyright © 2017 Camilo Medina. All rights reserved.
//

import Foundation
import MapKit

/**
    This class allows fetching the data from the API.
 */
class APIConnection {
    
    /**
        Information about the status of the request
     */
    public enum ResponseStatus {
        /// If an error occurs, handler block is called with a .error result and a String containing details about the error.
        case error(String)
        /// Called if the request was successful and the data is passed to the handler block.
        case success(Any)
    }
    
    /// Constant with the API URL
    let API_URL = "http://api.openweathermap.org/data/2.5/weather?"
    /// Constant needed to make requests to the API
    let API_KEY = "c6e381d8c7ff98f0fee43775817cf6ad"    
    
    /**
        This function allows to fetch the data from the API and the result is sent using the handler
     
        - Parameter location: contains the latitude and longitude coordinates
        - Parameter handler: function to handle the response callback
     */
    func fetchForecastAtLocation(_ location: CLLocationCoordinate2D, handler: @escaping (ResponseStatus) -> ()) {
        let urlRequest = API_URL + "lat=\(location.latitude)&lon=\(location.longitude)&appid=\(API_KEY)&units=metric"
        var request = URLRequest(url: URL(string: urlRequest)!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with: request) {data, response, err in
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
