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


class CafeView: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var SegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var myTableView: UITableView!
    let ComplexMenu:[String]=["Kamir","hello"]
    let Menu:[String]=["Sushi","Lagman"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var DynamicView=UIView(frame: CGRectMake(0, 0, 100, 20))
        DynamicView.backgroundColor=UIColor.greenColor()
      //  self.navigationItem.titleView = DynamicView
        
    }
    
    @IBAction func SegmentedControlAction(sender: AnyObject) {
        myTableView.reloadData()
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var b=0
        switch (SegmentedControl.selectedSegmentIndex) {
        case 0:
            b=ComplexMenu.count
            break
        case 1:
            b=Menu.count
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
            cell.textLabel?.text=ComplexMenu[indexPath.row]
            break
        case 1:
            cell.textLabel?.text=Menu[indexPath.row]
            break
        default:
            break
        }
        return cell
    }
    
    
}