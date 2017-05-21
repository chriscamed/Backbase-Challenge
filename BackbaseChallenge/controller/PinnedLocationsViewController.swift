//
//  PinnedLocationsViewController.swift
//  BackbaseChallenge
//
//  Created by Camilo Medina on 5/20/17.
//  Copyright © 2017 Camilo Medina. All rights reserved.
//

import UIKit

/** 
    View controller that lists the bookmarked locations using a UITableView
 */
class PinnedLocationsViewController: UIViewController {
    
    /// Table view used to show a list of bookmarked locations
    @IBOutlet weak var tableView: UITableView!
    /// An array of bookmarked locations
    fileprivate var pinnedLocations = [BookedLocation]()

    /// Function called before the view controller is shown to the user
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MapViewController {
            let vc = segue.destination as! MapViewController
            vc.pinnedLocations = pinnedLocations
            vc.delegate = self
        } else if segue.destination is CityForecastDetailViewController {
            let vc = segue.destination as! CityForecastDetailViewController
            vc.bookedLocation = pinnedLocations[sender as! Int]
        }
    }
}

/// PinnedLocationsViewController extension implementing the needed delegates and data sources
extension PinnedLocationsViewController: MapViewControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    /**
        Function called when a location is selecten on the map. It stores the location in an array.
        
        - Parameter annotation: object with the information about the forecast of the selected location
     */
    func addAnnotation(_ annotation: BookedLocation) {
        pinnedLocations.append(annotation)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pinnedLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = pinnedLocations[indexPath.row].cityName
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "cityForecastSegue", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            pinnedLocations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }
}
