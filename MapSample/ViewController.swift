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
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        mapView.delegate = self
        
    }
    //出発地と目的地が映る地図を表示し、線を結ぶ
    @IBAction func searchBtn(_ sender: UIButton) {
        stopTextField.resignFirstResponder()
        // 目的地の文字列から座標検索
        var geocoder = CLGeocoder()
        var destination = MKPointAnnotation()
        //検索ワードから位置を検索
        print("検索ワード",stopTextField.text!)
        geocoder.geocodeAddressString(stopTextField.text!, completionHandler: {(placemarks, error) in
            //検索結果が存在すれば、結果の最初のやつの位置情報を取得する
            if let placemark = placemarks?[0] as? CLPlacemark {
                print("検索結果あり")
                destination.coordinate = CLLocationCoordinate2DMake((placemark.location?.coordinate.latitude)!, (placemark.location?.coordinate.longitude)!)
                self.mapView.addAnnotation(destination)
                self.locationManager.startUpdatingLocation()
            }else{
                print("検索結果なし")
            }
        })
    }
    
    // 位置情報取得に成功したときに呼び出される.
    func locationManager(manager: CLLocationManager!,didUpdateLocations locations: [AnyObject]!){
 
        //現在地にピンを指す。
        let location = MKPointAnnotation()
        location.coordinate = CLLocationCoordinate2DMake((manager.location?.coordinate.latitude)!, (manager.location?.coordinate.longitude)!)
        location.title = "現在地"
        mapView.addAnnotation(location)
        print("位置情報取得成功")
        
    }
    // 位置情報取得に失敗した時に呼び出される.
    func locationManager(manager: CLLocationManager!,didFailWithError error: NSError!){
        
        print("位置情報取得失敗")
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

