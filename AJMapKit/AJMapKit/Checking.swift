//
//  Checking.swift
//  AJMapKit
//
//  Created by Suleymen Adilet on 4/27/16.
//  Copyright © 2016 Alejandro Jaque. All rights reserved.
//

//
import UIKit
import GoogleMaps
import Parse
import MBProgressHUD

class Checking: UIViewController, CLLocationManagerDelegate ,UIPickerViewDataSource, UIPickerViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate{
    
    
    @IBOutlet weak var FoodImage: UIImageView!
   
    @IBOutlet weak var FoodName: UITextField!
    
    @IBOutlet weak var FoodPrice: UITextField!

    @IBOutlet weak var FoodType: UIPickerView!
    
    @IBOutlet weak var FoodDescription: UITextField!
    
    var foodsImage: UIImage!
    var pickerDataSource = ["I-блюдо", "II-блюдо", "Салаты", "Напитки"];
    
    var FoodTypeText="I-блюдо"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.FoodName.delegate=self
        self.FoodPrice.delegate=self
        self.FoodDescription.delegate=self
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        FoodImage.userInteractionEnabled = true
        FoodImage.addGestureRecognizer(tapGestureRecognizer)
        FoodType.dataSource = self;
        FoodType.delegate = self;
        

    }
   
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func imageTapped(img: AnyObject)
    {
       	let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var newImage: UIImage
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        
        // do something interesting here!
        FoodImage.image=newImage
        foodsImage=newImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        FoodTypeText = pickerDataSource[row]
    }
    
    
    @IBAction func Cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func Done(sender: AnyObject) {
        print(PFUser.currentUser())
        let query = PFObject(className:"Foods")
        query["name"] = FoodName.text
        query["price"] = FoodPrice.text
        query["description"] = FoodDescription.text
        query["type"] = FoodTypeText
        query["place"] = PFUser.currentUser()
        
        let loadingNotification = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.Indeterminate
        loadingNotification.labelText = "Loading"
        
        let imageData: NSData = UIImageJPEGRepresentation(foodsImage, 1.0)!
        let imageFile: PFFile = PFFile(name:"image.jpg", data:imageData)!
        query["image"] = imageFile
        query.saveInBackgroundWithBlock { (_success:Bool, _error:NSError?) -> Void in
            if _error == nil
            {
                // yay its saved
                MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
                NSNotificationCenter.defaultCenter().postNotificationName("refreshtable", object: self)
                
                self.dismissViewControllerAnimated(true, completion: nil)
                
            }}

        
        
   
    }
    

}