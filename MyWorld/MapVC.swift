//
//  MapVC.swift
//  MyWorld
//
//  Created by user143594 on 11/18/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import UIKit
import MapKit


class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let manager = PlaceManager.shared
    var place: Place!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let region = MKCoordinateRegion(center: manager.places[1].coordinate, latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        mapView.setRegion(region, animated: true)
        
        for item in manager.places {
            mapView.addAnnotation(item)
        }
    }
    
    
     override func viewDidAppear(_ animated: Bool){
        //Showing the single place
        for item in manager.places{
            
            if place?.id == item.id {
                let actualPlace = place.coordinate
                let region = MKCoordinateRegion(center: actualPlace, latitudinalMeters: 10_000, longitudinalMeters: 10_000)
                mapView.setRegion(region, animated: true)
            }
        }
    }
}
