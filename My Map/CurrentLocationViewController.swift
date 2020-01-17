//
//  CurrentLocationViewController.swift
//  My Map
//
//  Created by MacStudent on 2020-01-16.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {
    
    var location = Map()
    
    var mTitle = ""
    var mSubTitle = ""
    var mLatitude = 0.0
    var mLongitude = 0.0
    
    
    @IBOutlet weak var tTitle: UITextField!
    @IBOutlet weak var subTitle: UITextField!
    @IBOutlet weak var longititude: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func donebtn(_ sender: UIButton) {
      
        
        mTitle = tTitle.text!
        mSubTitle =  subTitle.text!
        mLatitude =  Double(latitude.text!)!
        mLongitude =  Double(longititude.text!)!
        
        insertRecord(title: mTitle, subTitle: mSubTitle, latitude: mLatitude, longitude: mLongitude)
        
        self.view.setNeedsLayout()
          self.saveBtn.isEnabled = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveBtn.isEnabled = false
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    
    func insertRecord(title:String, subTitle:String, latitude: Double, longitude: Double){
        let location = Map(context: ViewController.managedContext)
        
        location.title = title
        location.subTitle = subTitle
        location.latitude = latitude
        location.longitude = longitude
        
        try! ViewController.managedContext.save()
    }
    
    
    
}


