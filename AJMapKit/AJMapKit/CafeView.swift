//
//  CafeView.swift
//  AJMapKit
//
//  Created by Suleymen Adilet on 4/20/16.
//  Copyright © 2016 Alejandro Jaque. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation
import GoogleMaps
import Parse

class CafeView: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var SegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var myTableView: UITableView!
    let ComplexMenu:[String]=["Kamir","hello"]
    @IBOutlet weak var IntervalLabel: UILabel!
    let Menu:[String]=["Sushi","Lagman"]
    
    var dataParse:NSMutableArray = NSMutableArray()
    var dataParse2:NSMutableArray = NSMutableArray()
        var lastComplex:PFObject!
    
    @IBOutlet weak var FoodPhoto: UIImageView!
    
    @IBOutlet weak var FoodName: UILabel!
    
    @IBOutlet weak var FoodPrice: UILabel!
    
    @IBOutlet weak var FoodDescription: UILabel!
    
    var showCafe:PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var DynamicView=UIView(frame: CGRectMake(0, 0, 100, 20))
        DynamicView.backgroundColor=UIColor.greenColor()
      //  self.navigationItem.titleView = DynamicView
        loadfoods()
    }
    
    @IBAction func SegmentedControlAction(sender: AnyObject) {
        myTableView.reloadData()
    }
    
    
    
    
    func loadfoods (){
        self.dataParse.removeAllObjects()
        let query3 = PFQuery(className: "Foods")
        query3.whereKey("place", equalTo: showCafe)
        query3.findObjectsInBackgroundWithBlock {
            (objects, error) -> Void in
            
            if error == nil {
                for object:PFObject in objects!
                {
                    self.dataParse.addObject(object)
                }
                
            }
            self.myTableView.reloadData()

            
        }
//        print("Hre")
//        var query = PFQuery(className: "ComplexMenu")
//        query.whereKey("place", equalTo: showCafe)
//        var temp:NSMutableArray=NSMutableArray()
//        query.orderByDescending("createdAt")
//        query.getFirstObjectInBackgroundWithBlock {(object: PFObject?, error: NSError?) -> Void in
//            if error==nil{
//                self.lastComplex=object!
//                temp=self.lastComplex["foods"]as! NSMutableArray
//                let d1:NSDate=self.lastComplex["beginTime"] as! NSDate
//                let d2:NSDate=self.lastComplex["endTime"] as! NSDate
//                
//                
//                
//                print("keldim")
//                var dateFormatter = NSDateFormatter()
//                dateFormatter.dateFormat = "hh:mm" //format style. Browse online to get a format that fits your needs.
//                var dateString = dateFormatter.stringFromDate(d1)
//          
//                var dateString2 = dateFormatter.stringFromDate(d2)
//              
//                self.IntervalLabel.text=dateString+dateString2
//                
//                for (var i=0;i<temp.count;i=i+1){
//                    var query2 = PFQuery(className: "Foods")
//                    print(temp[i])
//                    query2.whereKey("objectId", equalTo: temp[i])
//                    query2.getFirstObjectInBackgroundWithBlock {(objectr: PFObject?, error: NSError?) -> Void in
//                        if error==nil{
//                            print("hello")
//                            var c:PFObject=objectr!
//                            
//                            self.dataParse2.addObject(c)
//                            
//                        }}
//                    
//                }
//                
//         
//            }
        //}
        
        
        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var b=0
        switch (SegmentedControl.selectedSegmentIndex) {
        case 0:
            b=self.dataParse.count
            break
        case 1:
            b=self.dataParse.count
            break
        default:
            break
        }
    return b
    }
 
    

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell=tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        switch (SegmentedControl.selectedSegmentIndex) {
        case 0:
            //cell.textLabel?.text=ComplexMenu[indexPath.row]
            var nameLabel : UILabel = cell.contentView.viewWithTag(101) as! UILabel;
            var typeLabel : UILabel = cell.contentView.viewWithTag(102) as! UILabel;
            var priceLabel : UILabel = cell.contentView.viewWithTag(103) as! UILabel;
            var photoView : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView;
            let d=self.dataParse[indexPath.row]as! PFObject
            let file = d["image"]
            file.getDataInBackgroundWithBlock({ (data, error) -> Void in
                if let data = data where error == nil{
                    var image = UIImage(data: data)
                    photoView.image=image
                }
            })

            nameLabel.text=d["name"] as! String
                        typeLabel.text=d["type"] as! String
                        priceLabel.text=d["price"] as! String
            
            break
        case 1:
            var nameLabel : UILabel = cell.contentView.viewWithTag(101) as! UILabel;
            var typeLabel : UILabel = cell.contentView.viewWithTag(102) as! UILabel;
            var priceLabel : UILabel = cell.contentView.viewWithTag(103) as! UILabel;
            var photoView : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView;
            let d=self.dataParse[indexPath.row]as! PFObject
            let file = d["image"]
            file.getDataInBackgroundWithBlock({ (data, error) -> Void in
                if let data = data where error == nil{
                    var image = UIImage(data: data)
                    photoView.image=image
                }
            })
            
            nameLabel.text=d["name"] as! String
            typeLabel.text=d["type"] as! String
            priceLabel.text=d["price"] as! String
            break
        default:
            break
        }
        return cell
    }
    
    
}