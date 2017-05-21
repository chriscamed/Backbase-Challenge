//
//  CityForecastDetailViewController.swift
//  BackbaseChallenge
//
//  Created by Camilo Medina on 5/21/17.
//  Copyright © 2017 Camilo Medina. All rights reserved.
//

import UIKit
/**
    View controller that shows the forecast information of a selected city
 */
class CityForecastDetailViewController: UIViewController {
    
    /// IBOutlet referencing the temperatureLabel label
    @IBOutlet weak var temperatureLabel: UILabel!
    /// IBOutlet referencing the humidityLabel label
    @IBOutlet weak var humidityLabel: UILabel!
    /// IBOutlet referencing the rainChancesLabel label
    @IBOutlet weak var rainChancesLabel: UILabel!
    /// IBOutlet referencing the windInformationLabel label
    @IBOutlet weak var windInformationLabel: UILabel!
    /// Object received from the previous view controller to display the information about the forecast of the selected city
    var bookedLocation: BookedLocation?

    /// Function called before the view controller is shown to the user
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = bookedLocation {
            title = bookedLocation!.cityName
            temperatureLabel.text = "Temperature: \(bookedLocation!.temperature)ºC"
            humidityLabel.text = "Humidity: \(bookedLocation!.humidity)%"
            rainChancesLabel.text = "Rain chances: \(bookedLocation!.rainChances ?? 0)%"
            windInformationLabel.text = "Wind speed: \(bookedLocation!.windInformation)m/s"
        }
        
    }

}
