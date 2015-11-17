//
//  ViewController.swift
//  AJMapKit
//
//  Created by Alejandro on 6/3/15.
//  Copyright (c) 2015 Alejandro Jaque. All rights reserved.

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var myAddressView: UILabel!
    @IBOutlet weak var myLocationVIew: UILabel!
  
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.mapType = MKMapType.Hybrid
        CLLocationManager().requestAlwaysAuthorization()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Map Display and Region Zoom
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let regionToZoom = MKCoordinateRegionMake(manager.location.coordinate, MKCoordinateSpanMake(0.005, 0.005))
        
        mapView.setRegion(regionToZoom, animated: true)

        myLocationVIew.text = "\(locationManager.location)"
        
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in
                if error != nil {
                    println("Error: " + error.localizedDescription)
                    return
                }
                if placemarks.count > 0 {
                    let pm = placemarks[0] as! CLPlacemark
                    self.displayLocationInfo(pm)
                }
            })
        }
    
        func displayLocationInfo(placemark: CLPlacemark) {
            
// This Section stops updating location constantly.
            
            //   self.locationManager.stopUpdatingLocation()
            
// This Section display address parameters in a column on UILabel
//            var address = (
//                (placemark.subThoroughfare),
//                (placemark.thoroughfare),
//                (placemark.subLocality),
//                (placemark.locality),
//                (placemark.postalCode),
//                (placemark.administrativeArea),
//                (placemark.country))
            
//          myAddressView.text = "\(address)"
            
            
            myAddressView.text = " \(placemark.subThoroughfare) \(placemark.thoroughfare) \r \(placemark.subLocality) \r \(placemark.locality) \(placemark.administrativeArea) \(placemark.postalCode) \r \(placemark.country)"
         
            println("-----START UPDATE-----")
            println(placemark.subThoroughfare)
            println(placemark.thoroughfare)
            println(placemark.locality)
            println(placemark.postalCode)
            println(placemark.administrativeArea)
            println(placemark.country)
            println("--------------------")
            println("*** location: ***")
            println(locationManager.location)
            println("--------------------")
            println("*** addressDictionary: ***")
            println(placemark.addressDictionary)
            println("-----END OF UPDATE-----")
            
        }
    
        func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
            println("Error: " + error.localizedDescription)
        }

}


