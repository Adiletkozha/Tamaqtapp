//
//  myRoom.swift
//  AJMapKit
//
//  Created by Suleymen Adilet on 11/27/15.
//  Copyright © 2015 Alejandro Jaque. All rights reserved.
//
import UIKit
import GoogleMaps
import Parse
import MBProgressHUD

class myRoom: UIViewController, CLLocationManagerDelegate {


        var check:Bool!=false

    override func viewDidLoad() {
        super.viewDidLoad()
               self.navigationItem.setHidesBackButton(true, animated: false)
        var date1:NSDate!

        var query = PFQuery(className: "ComplexMenu")
        query.orderByDescending("createdAt")
        query.getFirstObjectInBackgroundWithBlock {(object: PFObject?, error: NSError?) -> Void in
            if error==nil{
                var c:PFObject=object!
                date1=c["endTime"] as! NSDate
                let date2 : NSDate = NSDate() //initialized by default with the current date
                
                let compareResult = date1.compare(date2)
                if compareResult == NSComparisonResult.OrderedDescending {
                    //date2<date1
                    print("sooo")
                    self.check=true
                }}
            

        
        
        }    }
    
    @IBAction func ComplexButton(sender: AnyObject) {
        
        if self.check == true {
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("showcomplex") as UIViewController, animated: true)}
        else {
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("complexID") as UIViewController, animated: true)}
        }

        


}