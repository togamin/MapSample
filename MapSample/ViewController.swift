//
//  ViewController.swift
//  MapSample
//
//  Created by Togami Yuki on 2018/09/23.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var stopTextField: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        mapView.delegate = self
        
    }
    
    
    
    @IBAction func searchBtn(_ sender: UIButton) {
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

