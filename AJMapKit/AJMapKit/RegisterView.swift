//
//  RegisterView.swift
//  AJMapKit
//
//  Created by Suleymen Adilet on 11/23/15.
//  Copyright © 2015 Alejandro Jaque. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import GoogleMaps
import Parse

class RegisterView: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

   
    @IBOutlet weak var loginText: UITextField!

    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var typeText: UITextField!
    @IBOutlet weak var administratorText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    var noerror=0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if identifier == "nextButton" {
           
            
            var user:PFUser!
            user=PFUser()
            user.email=loginText.text?.lowercaseString
            user.password=passwordText.text
            user.username=loginText.text?.lowercaseString
            user["type"]=typeText.text
            user["administratorText"]=administratorText.text
            user["phone"]=phoneText.text

       
            
            if (loginText.text?.characters.count < 8){
                return false;
            }
            
            user.signUpInBackgroundWithBlock { (_success:Bool, _error:NSError?) -> Void in
                if _error == nil
                {
    
                    let d=1
                    
                    print("saved")

                }
                
            }
           
            
            print(noerror)
          
           
            
        }
        return true;
        // by default, transition
     
    }

    
}