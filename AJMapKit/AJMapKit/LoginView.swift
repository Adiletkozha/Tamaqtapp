//
//  LoginView.swift
//  AJMapKit
//
//  Created by Suleymen Adilet on 5/2/16.
//  Copyright © 2016 Alejandro Jaque. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import GoogleMaps
import Parse


class LoginView: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
   
    
    @IBOutlet weak var emailF: UITextField!

    @IBOutlet weak var passwordF: UITextField!

    
    override func viewDidLoad() {

        super.viewDidLoad()
    }
 
    @IBAction func Login(sender: AnyObject) {
        
        var mail:String=self.emailF.text!.lowercaseString
        var pass:String=self.passwordF.text!
        PFUser.logOut()
        print(PFUser.currentUser())
        
        print("Hello")

            PFUser.logInWithUsernameInBackground(mail, password: pass) { (user, error) -> Void in
                if error == nil {
                    
                    print("succesful")
                    self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("myRoom") as UIViewController, animated: true)
                    
                    
                } else {
                    print("error:")
                }
            }
        
    }


}