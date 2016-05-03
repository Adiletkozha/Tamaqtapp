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
    @IBOutlet weak var CafeName: UILabel!
    var locationFixAchieved : Bool = false
    var locationStatus : NSString = "Not Started"
    var locationisselected=0;
    var showDetail:PFObject!
    @IBOutlet weak var NameOf: UILabel!
    @IBOutlet weak var TypeCafe: UILabel!
    @IBOutlet weak var IfComplex: UILabel!
    var locationManager: CLLocationManager!
    var itemsposition:CLLocationCoordinate2D!
    var markerlocations:NSArray!
    var complex=""
    
    

    
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
                   // marker.title = s["name"] as! String
                    marker.snippet = "Australia"
                  //  marker.userData=s.objectId! as String
                    marker.userData=s
                    marker.map = mapView
                }
            }}
        
        
        
    }
  
    

    
    
    

    
    
    
    func mapView(mapView:GMSMapView!, didTapInfoWindowOfMarker marker:GMSMarker!){
        // print("start dragging")

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
       let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CafeViewS") as! CafeView
        secondViewController.showCafe=marker.userData as! PFObject
        print(secondViewController.showCafe["name"])
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
        
        
        
 
       // performSegueWithIdentifier("hello", sender: nil)
    }
    

    
    
    func mapView(mapView: GMSMapView!, markerInfoWindow marker: GMSMarker!) -> UIView! {

        if let nibsView = NSBundle.mainBundle().loadNibNamed("GmsMapView", owner: self, options: nil) as? [UIView] {
            
            let nibRoot = nibsView[0]
            var g:PFObject=marker.userData as! PFObject
            self.showDetail=g
            
          

            var date1:NSDate!
            var query = PFQuery(className: "ComplexMenu")
            query.whereKey("place", equalTo: g)
            query.orderByDescending("createdAt")
            query.getFirstObjectInBackgroundWithBlock {(object: PFObject?, error: NSError?) -> Void in
                if error==nil{
                    var c:PFObject=object!
                    date1=c["endTime"] as! NSDate
                    let date2 : NSDate = NSDate() //initialized by default with the current date
                    
                    let compareResult = date1.compare(date2)
                    if compareResult == NSComparisonResult.OrderedDescending {

                        
                        var dateFormatter = NSDateFormatter()
                        dateFormatter.dateFormat = "hh:mm" //format style. Browse online to get a format that fits your needs.
                        var dateString = dateFormatter.stringFromDate(c["beginTime"] as! NSDate)
                        let DateBegin = dateString
                        var dateString2 = dateFormatter.stringFromDate(c["endTime"]as! NSDate)
                        let DateEnd = dateString2
                     //   let complex="с "+DateBegin+" до " + DateEnd

                        self.complex += "c "
                        self.complex += DateBegin
                        self.complex += " до "
                        self.complex += DateEnd
           

                    }
                }}
            self.NameOf.text=g["name"] as! String
            self.TypeCafe.text=g["type"] as! String

            self.IfComplex.text=self.complex
            self.IfComplex.backgroundColor=UIColor.greenColor()
            
            
            
            
            
            
            
            

            
            
            
            return nibRoot
        
//    
//        var DynamicView=UIView(frame: CGRectMake(0, 0, 150, 40))
//        DynamicView.backgroundColor=UIColor.greenColor()
//        DynamicView.addSubview(button)
//        return DynamicView
    }
        return nil
    }

    

        

        



    
    
    


    
    
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (locationFixAchieved == false) {
            locationFixAchieved = true
            var locationArray = locations as NSArray
            var locationObj = locationArray.lastObject as! CLLocation
            var coord = locationObj.coordinate
            
        }
    }
    
    
}