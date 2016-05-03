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

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var ComplexInfo: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBAction func logOutButton(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
               self.navigationItem.setHidesBackButton(true, animated: false)
        var date1:NSDate!
        self.typeLabel.text=PFUser.currentUser()!["type"] as! String
        self.NameLabel.text=PFUser.currentUser()!["name"] as! String
        self.ComplexInfo.text=""
        
        var query = PFQuery(className: "ComplexMenu")
        query.whereKey("place", equalTo: PFUser.currentUser()!)
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
                    var dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "hh:mm" //format style. Browse online to get a format that fits your needs.
                    var dateString = dateFormatter.stringFromDate(c["beginTime"] as! NSDate)
                    let DateBegin = dateString
                    var dateString2 = dateFormatter.stringFromDate(c["endTime"]as! NSDate)
                    let DateEnd = dateString2
                    self.ComplexInfo.text=" c "+dateString+" до  "+dateString2
           
                    
                }}
            

        
        
        }    }
    
    @IBAction func ComplexButton(sender: AnyObject) {
        
        if self.check == true {
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("showcomplex") as UIViewController, animated: true)}
        else {
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("complexID") as UIViewController, animated: true)}
        }

        


}