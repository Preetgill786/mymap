//
//  ViewController.swift
//  My Map
//
//  Created by MacStudent on 2020-01-16.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
  var selectPinView: MKAnnotation!
    static var  managedContext: NSManagedObjectContext!
    
    
    var locatonSingle = Map()

    var locationDataArray = [Map]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
       
    }
    
    func setPins() {
        
        var locValue:CLLocationCoordinate2D = CLLocationCoordinate2D()
        
        print("latitude" + "\(locValue.latitude)")
        print("latitude" + "\(locValue.longitude)")
        
        
        var pinPoint = [MKPointAnnotation]()
        
        locationDataArray = fetchRecords()
           mapView.removeAnnotations(mapView.annotations)
        for i in 0..<locationDataArray.count{
            let annotation = MKPointAnnotation()
            
            locValue.latitude = locationDataArray[i].latitude
            locValue.longitude = locationDataArray[i].longitude
            
            annotation.coordinate = locValue
            mapView.isZoomEnabled = false
            
         
            
            annotation.title = locationDataArray[i].title
            annotation.subtitle = locationDataArray[i].subTitle
            
            self.mapView.showAnnotations(self.mapView.annotations, animated: true)
            
            pinPoint.append(annotation)
              mapView.addAnnotation(annotation)
        }
        mapView.addAnnotations(pinPoint)
        
        let loca = CLLocationCoordinate2DMake(locValue.latitude,
                                              locValue.longitude)
        let coordinateRegion = MKCoordinateRegion(center: loca,
                                                  latitudinalMeters: 4000000, longitudinalMeters: 4000000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
         setPins()
       }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
       
           
           selectPinView = view.annotation
    }
    
       func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
           // selectPinView = annotation
            
           // print("Selected == \(selectPinView.title)")
            if !(annotation is MKUserLocation) {
                
                let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: String(annotation.hash))

                
                let rightButton = UIButton(type: .infoDark)
                rightButton.tag = annotation.hash
                rightButton.addTarget(self, action: #selector(annoBtnPressed), for: .touchDown)
                pinView.animatesDrop = true
                pinView.canShowCallout = true
                pinView.rightCalloutAccessoryView = rightButton
                
    
                return pinView
            }
            else {
                return nil
            }
        }
        
        @objc func annoBtnPressed(){
            self.view.layoutIfNeeded()
            
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UpdateViewController") as? UpdateViewController {
                       
                       
                       for i in 0..<self.locationDataArray.count{
                           if(self.locationDataArray[i].subTitle ==  ((selectPinView?.subtitle)!) ){
                               self.locatonSingle = self.locationDataArray[i]
                               break
                           }}
                    viewController.locMap = self.locatonSingle
                       
                       
                       if let navigator1 = self.navigationController {
                           navigator1.pushViewController(viewController, animated: true)
                       }
      
            }
            
        }

     
        func insertRecord(title:String, subTitle:String,latitude: Double,longitude: Double){
            
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


    }


