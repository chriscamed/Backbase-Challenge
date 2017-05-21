//
//  BookedLocation.swift
//  Backbase Challenge
//
//  Created by Camilo Medina on 5/20/17.
//  Copyright © 2017 Camilo Medina. All rights reserved.
//

import Foundation

/**
    Struct to store the forecast information about the selected location on the map
 */
struct BookedLocation {
    /// The city of the bookmarked location
    var cityName: String = ""
    /// The temperature of the bookmarked location
    var temperature: Double = 0.0
    /// The humidity of the bookmarked location
    var humidity: Double = 0.0
    /// The percentage of rain chances of the bookmarked location
    var rainChances: Double?
    /// The speed of the wind of the bookmarked location
    var windInformation: Double = 0.0
    /// The latitude of the bookmarked location
    var latitude: Double = 0.0
    /// The longitude of the bookmarked location
    var longitude: Double = 0.0
    
    
    /**
        Creates an instance of a **BookedLocation**
     
        - Parameter cityName: the city of the selected location
        - Parameter temperature: the temperature of the selected location
        - Parameter humidity: the humidity of the selected location
        - Parameter rainChances: the rainChances of the selected location
        - Parameter windInformation: the windInformation of the selected location
        - Parameter latitude: the latitude of the selected location
        - Parameter longitude: the longitude of the selected location
     */
    init(cityName: String, temperature: Double, humidity: Double, rainChances: Double?, windInformation: Double, latitude: Double, longitude: Double) {
        self.cityName = cityName
        self.temperature = temperature
        self.humidity = humidity
        self.rainChances = rainChances
        self.windInformation = windInformation
        self.latitude = latitude
        self.longitude = longitude
    }
}
