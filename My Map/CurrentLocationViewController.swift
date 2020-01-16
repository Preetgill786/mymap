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
  
  
    @IBAction func save(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
   
    @IBOutlet weak var getButton: UIButton!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
}
