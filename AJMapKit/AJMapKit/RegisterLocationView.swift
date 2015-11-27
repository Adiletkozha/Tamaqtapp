//
//  RegisterLocationView.swift
//  AJMapKit
//
//  Created by Suleymen Adilet on 11/23/15.
//  Copyright © 2015 Alejandro Jaque. All rights reserved.
//


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
import MBProgressHUD
import FTUtils

class RegisterLocationView: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {
    var seenError : Bool = false
    var locationFixAchieved : Bool = false
    var locationStatus : NSString = "Not Started"
    var locationisselected=0;
    var locationManager: CLLocationManager!
    var itemsposition:CLLocationCoordinate2D!
    var markerlocations:NSArray!
    var myGeoPoint:PFGeoPoint!

    
    
    @IBOutlet weak var ReadyShow: UIButton!
    
    @IBAction func ReadyButton(sender: AnyObject) {
        
        if(locationisselected==1){
    
            var currentUser:PFUser = PFUser.currentUser()!
            currentUser.setObject(myGeoPoint, forKey: "point")
            currentUser.saveInBackground()
          
            currentUser.saveInBackgroundWithBlock { (_success:Bool, _error:NSError?) -> Void in
                if _error == nil
                {
                  
              
                    print("point saved")
                    
                    
                }}
            
            
            
            let loadingNotification = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            loadingNotification.mode = MBProgressHUDMode.Indeterminate
            loadingNotification.labelText = "Loading"
            loadingNotification.hide(true)
            
              
            self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
            
            
//           self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("CompleteRegister") as UIViewController, animated: true)
//            
      
        }
        else{
   
        
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ReadyShow.hidden=true;
        
        var alert = UIAlertController(title: "Помощь", message: "Укажите место предприятия. Для этого удерживайте палец нужном месте", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        
        
        
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
        

     
        
        
        
    }
    
    
    func userAssign(){
        let install=PFInstallation.currentInstallation()
       install["user"]=PFUser.currentUser()
     
        install.saveInBackgroundWithBlock{ (_success:Bool, _error:NSError?) -> Void in
            if _error == nil
            {
                
                
                print("p")
                
                
            }}
        

    }
    
    
    
    func mapView(mapView:GMSMapView, didBeginDraggingMarker marker:GMSMarker){
        // print("start dragging")
    }
    
    func mapView(mapView:GMSMapView, didEndDraggingMarker marker:GMSMarker){
        print(marker.position.latitude)
        print(marker.position.longitude)
        itemsposition=marker.position
        myGeoPoint = PFGeoPoint(latitude: itemsposition.latitude, longitude:itemsposition.longitude)
        
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
            marker.draggable=true
            var alert = UIAlertController(title: "Успешно", message: "Удерживая палец на маркере вы можете передвигать его", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        locationisselected=1
        ReadyShow.hidden=false
    
        
        
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