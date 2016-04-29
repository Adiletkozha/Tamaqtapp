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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let query2 = PFQuery(className: "Foods")
        query2.findObjectsInBackgroundWithBlock {
            (objects, error) -> Void in
            
            if error == nil {
                
                self.foods=objects!
                print(objects!.count)
                
                for(var i=0;i<objects!.count;i=i+1){
                    
                    var s: PFObject;
                    s=objects![i];
                    let  point :PFGeoPoint!
                    point=s["point"] as! PFGeoPoint
                
 
                }}}
        
}
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
    return self.foods.count
    }
  
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
            let cell=tableView.dequeueReusableCellWithIdentifier("myCells", forIndexPath: indexPath)
        
        var nameLabel : UILabel = cell.contentView.viewWithTag(10) as! UILabel;
                var d:PFObject=self.foods[indexPath.row] as! PFObject
        nameLabel.text=d["name"] as! String

            return cell
    }
    
    
    
    @IBAction func AddFood(sender: AnyObject) {
    }
}