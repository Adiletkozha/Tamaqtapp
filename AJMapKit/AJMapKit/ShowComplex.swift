//
//  ShowComplex.swift
//  AJMapKit
//
//  Created by Suleymen Adilet on 5/1/16.
//  Copyright © 2016 Alejandro Jaque. All rights reserved.
//

//
//  FoodsView.swift
//  AJMapKit
//
//  Created by Suleymen Adilet on 4/21/16.
//  Copyright © 2016 Alejandro Jaque. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import GoogleMaps
import Parse


class ShowComplex: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var DateBegin: UILabel!
    @IBOutlet weak var DateEnd: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    var lastComplex:PFObject!
    var foods:NSArray!
    var dataParse:NSMutableArray = NSMutableArray()
    var refreshControl: UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector:"refreshtable:",
            name:"refreshtable",
            object: nil)
        
        loadfoods()
        
        
        
        //     let arrays:NSArray = self.dataParse.reverseObjectEnumerator().allObjects
        //  self.dataParse = array as NSMutableArray
        // self.dataParse=NSMutableArray(array: arrays)
        
        self.myTableView.reloadData()
        
    }
    
    

    
    
    func loadfoods (){
        var query = PFQuery(className: "ComplexMenu")
        query.whereKey("place", equalTo: PFUser.currentUser()!)
        var temp:NSMutableArray=NSMutableArray()
        query.orderByDescending("createdAt")
        query.getFirstObjectInBackgroundWithBlock {(object: PFObject?, error: NSError?) -> Void in
            if error==nil{
                self.lastComplex=object!
                temp=self.lastComplex["foods"]as! NSMutableArray
                let d1:NSDate=self.lastComplex["beginTime"] as! NSDate
                let d2:NSDate=self.lastComplex["endTime"] as! NSDate
                
                
           
                
                var dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "hh:mm" //format style. Browse online to get a format that fits your needs.
                var dateString = dateFormatter.stringFromDate(d1)
                self.DateBegin.text = dateString
                var dateString2 = dateFormatter.stringFromDate(d2)
                self.DateEnd.text = dateString2
                
                for (var i=0;i<temp.count;i=i+1){
                    var query2 = PFQuery(className: "Foods")
                    print(temp[i])
                    query2.whereKey("objectId", equalTo: temp[i])
                    query2.getFirstObjectInBackgroundWithBlock {(objectr: PFObject?, error: NSError?) -> Void in
                        if error==nil{
                            print("hello")
                            var c:PFObject=objectr!
           
                            self.dataParse.addObject(c)
                            self.myTableView.reloadData()
                            }}
                    
                }

                print(self.dataParse.count)
            }
        }
        
    }
    
    
    
    override func viewDidAppear(animated:Bool) {
        super.viewDidAppear(animated)
        //        let query2 = PFQuery(className: "Foods")
        //        query2.findObjectsInBackgroundWithBlock {
        //            (objects, error) -> Void in
        //
        //            if error == nil {
        //
        //                self.foods=objects!
        //                print(self.foods.count)
        //
        //                for(var i=0;i<objects!.count;i=i+1){
        //
        //                    var s: PFObject;
        //                    s=self.foods[i] as! PFObject;
        //                    print(s["name"])
        //
        //  }}}
    }
    
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        let obj:PFObject=self.dataParse[indexPath.row] as! PFObject
        self.dataParse.removeObject(obj)
        var temp:NSMutableArray=NSMutableArray()
        for(var i=0;i<dataParse.count;i++){
            var d:PFObject=self.dataParse[i] as! PFObject
            temp.addObject(d.objectId!)
        }
        self.lastComplex["foods"]=temp
        self.lastComplex.saveInBackground()
        self.myTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        return dataParse.count
        
    }
    
    
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell=tableView.dequeueReusableCellWithIdentifier("myCell1", forIndexPath: indexPath)
        
        var nameLabel : UILabel = cell.contentView.viewWithTag(31) as! UILabel;
        var d:PFObject=self.dataParse[indexPath.row] as! PFObject
        nameLabel.text=d["name"] as! String
        print(d["name"])
 
        
        var ImageFood : UIImageView = cell.contentView.viewWithTag(30) as! UIImageView;
        var d3:PFObject=self.dataParse[indexPath.row] as! PFObject
        let file = d3["image"]
        file.getDataInBackgroundWithBlock({ (data, error) -> Void in
            if let data = data where error == nil{
                var image = UIImage(data: data)
                ImageFood.image=image
            }
        })
        
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func AddFood(sender: AnyObject) {
    }
}