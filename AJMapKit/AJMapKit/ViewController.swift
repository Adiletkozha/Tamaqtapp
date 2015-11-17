//
//  ViewController.swift
//  AJMapKit
//
//  Created by Alejandro on 6/3/15.
//  Copyright (c) 2015 Alejandro Jaque. All rights reserved.

import UIKit
import MapKit
import CoreLocation
import GoogleMaps


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
        
        dispatch_async(dispatch_get_main_queue(),
            {
      
        
             
               
               
                
        })
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Map Display and Region Zoom
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let regionToZoom = MKCoordinateRegionMake(manager.location!.coordinate, MKCoordinateSpanMake(0.005, 0.005))
        
        var locationArray = locations as NSArray
        var locationObj = locationArray.lastObject as! CLLocation
        var coord = locationObj.coordinate
     
        var marker = GMSMarker(position:CLLocationCoordinate2DMake(coord.latitude, coord.longitude))
       // marker.map = mapView
        //marker.title = "Hello World"
        
        mapView.setRegion(regionToZoom, animated: true)

        myLocationVIew.text = "\(locationManager.location)"
        
        
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: { (placemarks, error) -> Void in
                if error != nil {
                    print("Error: " + error!.localizedDescription)
                    return
                }
                if placemarks!.count > 0 {
                    let pm = placemarks![0] as! CLPlacemark
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
         
            print("-----START UPDATE-----")
            print(placemark.subThoroughfare)
            print(placemark.thoroughfare)
            print(placemark.locality)
            print(placemark.postalCode)
            print(placemark.administrativeArea)
            print(placemark.country)
            print("--------------------")
            print("*** location: ***")
            print(locationManager.location)
            print("--------------------")
            print("*** addressDictionary: ***")
            print(placemark.addressDictionary)
            print("-----END OF UPDATE-----")
            
        }
    
        func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
            print("Error: " + error.localizedDescription)
        }

}


