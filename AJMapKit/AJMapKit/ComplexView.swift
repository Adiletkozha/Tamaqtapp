//
//  ComplexView.swift
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


class ComplexView: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var DateBegin: UIDatePicker!
    
    @IBOutlet weak var DateEnd: UIDatePicker!
    @IBOutlet weak var myTableView: UITableView!
   
    var foods:NSArray!
    var dataParse:NSMutableArray = NSMutableArray()
    var refreshControl: UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.setEditing(true, animated: true)
        self.myTableView.allowsMultipleSelectionDuringEditing = true
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

    }
    
    
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        return dataParse.count
    }
    
    
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell=tableView.dequeueReusableCellWithIdentifier("Cellss", forIndexPath: indexPath)
        
        var nameLabel : UILabel = cell.contentView.viewWithTag(4) as! UILabel;
        var d:PFObject=self.dataParse[indexPath.row] as! PFObject
        nameLabel.text=d["name"] as! String
        

        
        var ImageFood : UIImageView = cell.contentView.viewWithTag(3) as! UIImageView;
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