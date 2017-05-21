//
//  HelpViewController.swift
//  BackbaseChallenge
//
//  Created by Camilo Medina on 5/21/17.
//  Copyright © 2017 Camilo Medina. All rights reserved.
//

import UIKit

/**
    View controller that shows an user guide
 */
class HelpViewController: UIViewController {
    
    /// Web view used to display HTML content
    @IBOutlet weak var webView: UIWebView!

    /// Function called before the view controller is shown to the user
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "help", withExtension:"html")        
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
}
