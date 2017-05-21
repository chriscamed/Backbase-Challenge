//
//  ViewController.swift
//  Challenge
//
//  Created by Camilo Medina on 5/20/17.
//  Copyright © 2017 Camilo Medina. All rights reserved.
//

import UIKit
import MapKit

/**
    Protocol needed to know when a location has been bookmarked
 */
protocol MapViewControllerDelegate: class {
    /**
        Function called when a user has pinned a location on the map
        - Parameter annotation: a BookedLocation object with the info of the selected city forecast
     */
    func addAnnotation(_ annotation: BookedLocation)
}

/**
    View controller displaying a MapView
 */
class MapViewController: UIViewController {
    
    /// MapView view used to display a map
    @IBOutlet weak var mapView: MKMapView!
    /// An array of bookmarked locations
    var pinnedLocations: [BookedLocation]?
    /// delegate to call when hold press on the map
    weak var delegate: MapViewControllerDelegate?

    /// Function called before the view controller is shown to the user
    override func viewDidLoad() {
        super.viewDidLoad()
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressEvent))
        longPressGesture.minimumPressDuration = 0.5
        mapView.addGestureRecognizer(longPressGesture)
        if let _ = pinnedLocations {
            pinnedLocations!.forEach {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)
                mapView.addAnnotation(annotation)
            }
        }
    }
    
    /**
        Function to handle what happen when the user hold press on the map
        
        - Parameter gesture: gesture sent by the selector
     */
    func longPressEvent(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let point = gesture.location(in: mapView)
            let tapPoint = mapView.convert(point, toCoordinateFrom: self.view)
            APIConnection().fetchForecastAtLocation(tapPoint) { status in
                switch status {
                case let .success(data):
                    print(data)
                    guard let dict = data as? [String: Any] else {
                       return
                    }
                    let cityName = dict["name"] as! String
                    let latitude = (dict["coord"] as? [String: Any])?["lat"] as! Double
                    let longitude = (dict["coord"] as? [String: Any])?["lon"] as! Double
                    let temperature = (dict["main"] as? [String: Any])?["temp"] as! Double
                    let humidity = (dict["main"] as? [String: Any])?["humidity"] as! Double
                    let rainChances = (dict["rain"] as? [String: Any])?["3h"] as? Double
                    let windInformation = (dict["wind"] as? [String: Any])?["speed"] as! Double
                    self.delegate?.addAnnotation(BookedLocation(cityName: cityName, temperature: temperature, humidity: humidity, rainChances: rainChances, windInformation: windInformation, latitude: latitude, longitude: longitude))
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = tapPoint
                    DispatchQueue.main.async {
                        self.mapView.addAnnotation(annotation)
                    }
                case let .error(error):
                    let alertController = UIAlertController(title: "Error", message: "An unexpected error occurred: \(error)", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
        }
    }

}
