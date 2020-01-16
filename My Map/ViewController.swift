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
      var mTitle = ""
         var mSubTitle = ""
         var mLatitude = 0.0
         var mLongitude = 0.0
    var locationDataArray = [Map]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func setPins() {
        
        var locValue:CLLocationCoordinate2D = CLLocationCoordinate2D()
        
        print("latitude" + "\(locValue.latitude)")
        print("latitude" + "\(locValue.longitude)")
        
        
        var pinPoint = [MKPointAnnotation]()
        
       // locationDataArray = fetchRecords()
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
            //  mapView.addAnnotation(annotation)
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
         //  setPins()
       }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
       
           
           selectPinView = view.annotation
    }
    
    
}

