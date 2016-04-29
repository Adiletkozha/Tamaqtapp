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
       // mapView.delegate=self
        mapView.delegate=self
        
        let status = CLLocationManager.authorizationStatus()
        if(status == CLAuthorizationStatus.NotDetermined) {
            self.locationManager.requestAlwaysAuthorization();
        }

        self.locationManager.startUpdatingLocation();
        
        let query2 = PFQuery(className: "_User")
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
  
    

    
    
    

    
    
    
    func mapView(mapView:GMSMapView!, didTapInfoWindowOfMarker marker:GMSMarker!){
        // print("start dragging")
        print("hello")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CafeViewS") as! CafeView
     //   self.navigationController?.pushViewController(secondViewController, animated: true)
        print("bye")
        
        
        
 
        performSegueWithIdentifier("hello", sender: nil)
    }
    

    
    
    func mapView(mapView: GMSMapView!, markerInfoWindow marker: GMSMarker!) -> UIView! {
        let button   = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(0, 0, 60, 20)
        button.backgroundColor = UIColor.blackColor()
        button.setTitle("Show", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
       
     
        
    
        var DynamicView=UIView(frame: CGRectMake(0, 0, 200, 50))
        DynamicView.backgroundColor=UIColor.greenColor()
        DynamicView.addSubview(button)
        return DynamicView
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