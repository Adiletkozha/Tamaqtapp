//
//  NavigationController.swift
//  AJMapKit
//
//  Created by Suleymen Adilet on 5/5/16.
//  Copyright © 2016 Alejandro Jaque. All rights reserved.
//

class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Status bar white font
        self.navigationBar.barStyle = UIBarStyle.Black
        self.navigationBar.tintColor = UIColor.whiteColor()
    }
}