//
//  ViewController.swift
//  Challenge
//
//  Created by Camilo Medina on 5/20/17.
//  Copyright © 2017 Camilo Medina. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    var annotationList: [MKPointAnnotation]?

    override func viewDidLoad() {
        super.viewDidLoad()
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressEvent))
        longPressGesture.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(longPressGesture)
        if let _ = annotationList {
            annotationList?.forEach { mapView.addAnnotation($0) }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func longPressEvent(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let point = gesture.location(in: mapView)
            let tapPoint = mapView.convert(point, toCoordinateFrom: self.view)
            APIConnection().fetchForecastAtLocation(tapPoint) { status in
                switch status {
                case let .success(data):
                    print(data)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = tapPoint
                    DispatchQueue.main.async {
                        self.mapView.addAnnotation(annotation)
                    }
                case let .error(error):
                    print(error)
                }
                
            }
        }
    }

}
