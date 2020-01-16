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
    
    //var managedContext: NSManagedObjectContext!
    
 
    @IBOutlet weak var mTitle: UITextField!
    @IBOutlet weak var subTitle: UITextField!
  
    @IBOutlet weak var longititude: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func donebtn(_ sender: UIButton) {
        
        
    }
    
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
}


