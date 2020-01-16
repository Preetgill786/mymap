//
//  UpdateViewController.swift
//  My Map
//
//  Created by MacStudent on 2020-01-16.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var subTitleText: UITextField!
    @IBOutlet weak var longititudeText: UITextField!
    @IBOutlet weak var latitudeText: UITextField!
    
    @IBAction func doneBtn(_ sender: UIBarButtonItem) {
        
        self.updateRecord(location:locMap, title: titleText.text!, subTitle: subTitleText.text!, latitude: Double(latitudeText.text!)!, longitude: Double(longititudeText.text!)!)
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    var locMap = Map()
    
    @IBAction func dltBtn(_ sender: Any) {
        deleteRecord(location: locMap)
        titleText.text = ""
        subTitleText.text = ""
        longititudeText.text = ""
        latitudeText.text = ""
          self.navigationController?.popToRootViewController(animated: true)
    }
    func deleteRecord( location : Map){
        ViewController.managedContext.delete(location)
        try! ViewController.managedContext.save()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText.text = locMap.title
        subTitleText.text = locMap.subTitle
        longititudeText.text = locMap.longitude.description
        latitudeText.text = locMap.latitude.description
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //ViewController.managedContext = coreDataStack.managedContext
        
        
    }
    
    
    
    func updateRecord(location:Map,title:String,subTitle:String,latitude: Double,longitude: Double){
        
        
        location.title = title
        location.subTitle = subTitle
        location.latitude = latitude
        location.longitude = longitude
        try! ViewController.managedContext.save()
    }
    
}



