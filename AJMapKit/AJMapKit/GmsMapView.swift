//
//  GmsMapView.swift
//  AJMapKit
//
//  Created by Suleymen Adilet on 11/8/15.
//  Copyright © 2015 Alejandro Jaque. All rights reserved.
//
import UIKit
import GoogleMaps


class GmsMapView: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {
    var seenError : Bool = false
    var locationFixAchieved : Bool = false
    var locationStatus : NSString = "Not Started"
    var locationisselected=0;
    var locationManager: CLLocationManager!
    var itemsposition:CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var camera = GMSCameraPosition.cameraWithLatitude(-33.86,
            longitude: 151.20, zoom: 6)

        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.settings.compassButton = true;
        mapView.settings.myLocationButton = true;
    

        dispatch_async(dispatch_get_main_queue(), {
            mapView.myLocationEnabled = true;
            });
        self.view = mapView
        
        
        self.locationManager=CLLocationManager()
        self.locationManager.delegate = self;
        mapView.delegate=self
        
        
        let status = CLLocationManager.authorizationStatus()
        if(status == CLAuthorizationStatus.NotDetermined) {
            self.locationManager.requestAlwaysAuthorization();
        }

        self.locationManager.startUpdatingLocation();
    }
  
    

    
    
    
    func mapView(mapView:GMSMapView, didBeginDraggingMarker marker:GMSMarker){
    // print("start dragging")
    }
    
    func mapView(mapView:GMSMapView, didEndDraggingMarker marker:GMSMarker){
        print(marker.position.latitude)
        print(marker.position.longitude)
        itemsposition=marker.position
    }

    
    func mapView(mapView:GMSMapView, didLongPressAtCoordinate coordinate:CLLocationCoordinate2D){
        if(locationisselected==0){
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
            marker.draggable=true}
        locationisselected++
        
        
       
    }
    
    
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (locationFixAchieved == false) {
            locationFixAchieved = true
            var locationArray = locations as NSArray
            var locationObj = locationArray.lastObject as! CLLocation
            var coord = locationObj.coordinate
            
            print(coord.latitude)
            print(coord.longitude)
            print("something")
        }
    }
    
    
}