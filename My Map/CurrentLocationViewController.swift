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
     var refreshControl = UIRefreshControl()
      var location = Map()
    
    var mTitle = ""
       var mSubTitle = ""
       var mLatitude = 0.0
       var mLongitude = 0.0
       var locArry = [Map]()
       var pinsArry = [Map]()
 
   
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
        self.saveBtn.isEnabled = true

               let tt = tTitle.text
               let st = subTitle.text
               let lt = latitude.text
               let lgt = longititude.text
               
                self.fetchAndUpdateTable()
               mTitle = tt!
               mSubTitle =  st!
               mLatitude =  Double(lt!)!
               mLongitude =  Double(lgt!)!
               
              self.insertRecord(title: mTitle, subTitle: mSubTitle, latitude: mLatitude, longitude: mLongitude)
                self.fetchAndUpdateTable()
               self.view.setNeedsLayout()
              // self.tableView.reloadData()
        
    }
    
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pinsArry = locArry
               self.saveBtn.isEnabled = false
  
    
}

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)

          // managedContext = coreDataStack.managedContext
       refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
   refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
//           tableView.addSubview(refreshControl)
         fetchAndUpdateTable()

             
       }

     @objc func refresh() {
           
           
            self.refreshControl.endRefreshing()
        }
        func fetchAndUpdateTable(){
               locArry = fetchRecords()
               pinsArry = locArry

              
           }
    
    func insertRecord(title:String, subTitle:String, latitude: Double, longitude: Double){
          let location = Map(context: ViewController.managedContext)
             
                   location.title = title
                   location.subTitle = subTitle
                   location.latitude = latitude
                   location.longitude = longitude
                   
          try! ViewController.managedContext.save()
               }
         
      
      
         func fetchRecords() -> [Map]{
            var arrLocation = [Map]()
            let fetchRequest = NSFetchRequest<Map>(entityName: "Map")
            
                do{
                  arrLocation = try ViewController.managedContext.fetch(fetchRequest)
                }catch{
                    print(error)
                }
                return arrLocation
            }

      
            func deleteRecord( location : Map){
              ViewController.managedContext.delete(location)
              try! ViewController.managedContext.save()
            }
            
      
      
            func updateRecord(location:Map,title:String,subTitle:String,latitude: Double,longitude: Double){
                
                
                    location.title = title
                    location.subTitle = subTitle
                    location.latitude = latitude
                    location.longitude = longitude
              try! ViewController.managedContext.save()
            }
        
    }


