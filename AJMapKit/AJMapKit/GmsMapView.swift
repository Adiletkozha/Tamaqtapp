//
//  GmsMapView.swift
//  AJMapKit
//
//  Created by Suleymen Adilet on 11/8/15.
//  Copyright © 2015 Alejandro Jaque. All rights reserved.
//
import UIKit
import GoogleMaps
import Parse

class GmsMapView: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {
    var seenError : Bool = false
    var locationFixAchieved : Bool = false
    var locationStatus : NSString = "Not Started"
    var locationisselected=0;
    var locationManager: CLLocationManager!
    var itemsposition:CLLocationCoordinate2D!
    var markerlocations:NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var camera = GMSCameraPosition.cameraWithLatitude(43.255058,
            longitude: 76.912628, zoom: 12)

        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.settings.compassButton = true;
        mapView.settings.myLocationButton = true;
        mapView.settings.zoomGestures=true;

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
        
        let query2 = PFQuery(className: "Locations")
        query2.findObjectsInBackgroundWithBlock {
            (objects, error) -> Void in
            
            if error == nil {
                
                self.markerlocations=objects!
                print(objects!.count)
                
                for(var i=0;i<objects!.count;i=i+1){
                    
                    var s: PFObject;
                    s=objects![i];
                    let  point :PFGeoPoint!
                    point=s["point"] as! PFGeoPoint
                    print(point.latitude)
                    let getLatParse : CLLocationDegrees = point.latitude
                    let getLongParse : CLLocationDegrees = point.longitude
                    
                    let localParse = CLLocationCoordinate2D(latitude: getLatParse, longitude: getLongParse)
                    var marker = GMSMarker()
                    marker.position = CLLocationCoordinate2DMake(localParse.latitude, localParse.longitude)
                    marker.title = "Sydney"
                    marker.snippet = "Australia"
                    marker.map = mapView
                }
            }}
        
        
        
    }
  
    

    
    
    
    func mapView(mapView:GMSMapView, didBeginDraggingMarker marker:GMSMarker){
    // print("start dragging")
    }
    
    func mapView(mapView:GMSMapView, didEndDraggingMarker marker:GMSMarker){
        print(marker.position.latitude)
        print(marker.position.longitude)
        itemsposition=marker.position
        let myGeoPoint = PFGeoPoint(latitude: itemsposition.latitude, longitude:itemsposition.longitude)
        
        let query = PFObject(className:"Locations")
        query["point"] = myGeoPoint
        query.saveInBackgroundWithBlock { (_success:Bool, _error:NSError?) -> Void in
            if _error == nil
            {
                // yay its saved
            }}
        
        

        



    
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