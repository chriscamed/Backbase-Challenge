//
//  BookedLocation.swift
//  Backbase Challenge
//
//  Created by Camilo Medina on 5/20/17.
//  Copyright © 2017 Camilo Medina. All rights reserved.
//

import Foundation

struct BookedLocation {
    var temperature: Double = 0.0
    var humidity: Double = 0.0
    var rainChances: Double = 0.0
    var windInformation: Double = 0.0
    
    init(temperature: Double, humidity: Double, rainChances: Double, windInformation: Double) {
        self.temperature = temperature
        self.humidity = humidity
        self.rainChances = rainChances
        self.windInformation = windInformation
    }
}
