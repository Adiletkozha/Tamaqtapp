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



    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var currentUser:PFUser = PFUser.currentUser()!
        print(currentUser["username"])
        
        
    }
}