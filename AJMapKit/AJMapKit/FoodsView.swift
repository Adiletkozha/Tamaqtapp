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


class FoodsView: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var myTableView: UITableView!
    var foods:NSArray!
    var dataParse:NSMutableArray = NSMutableArray()
    var refreshControl: UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: "loadfoods", forControlEvents: UIControlEvents.ValueChanged)
        myTableView.addSubview(refreshControl)
        
        
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
    
    
    func refreshtable(notification: NSNotification){

        
        loadfoods()

        
    }
    
    
    func loadfoods (){
        self.dataParse.removeAllObjects()
        let query2 = PFQuery(className: "Foods")
        query2.findObjectsInBackgroundWithBlock {
            (objects, error) -> Void in
            
            if error == nil {
                for object:PFObject in objects!
                {
                self.dataParse.addObject(object)
                }
                
            }
        print (self.dataParse.count)
                self.myTableView.reloadData()
          self.refreshControl.endRefreshing()

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
        obj.deleteInBackgroundWithBlock { (succeeded: Bool, error: NSError?) -> Void in
            
            // succeeded = true, but record was not deleted....
        }
        self.dataParse.removeObject(obj)
        self.myTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
    return dataParse.count
    }
    
    
  
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
            let cell=tableView.dequeueReusableCellWithIdentifier("myCells", forIndexPath: indexPath)
        
        var nameLabel : UILabel = cell.contentView.viewWithTag(11) as! UILabel;
                var d:PFObject=self.dataParse[indexPath.row] as! PFObject
        nameLabel.text=d["name"] as! String
        
        var PriceLabel : UILabel = cell.contentView.viewWithTag(12) as! UILabel;
        var d2:PFObject=self.dataParse[indexPath.row] as! PFObject
        PriceLabel.text=d["price"] as! String
        
        var typeLabel : UILabel = cell.contentView.viewWithTag(13) as! UILabel;
        var d4:PFObject=self.dataParse[indexPath.row] as! PFObject
        typeLabel.text=d["type"] as! String
        
        var ImageFood : UIImageView = cell.contentView.viewWithTag(10) as! UIImageView;
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