//
//  Place.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import Foundation
import MapKit


final class Place: NSObject, Codable {

    enum PlaceType {
        case generic
        case touristic
    }
    
    var pickerViewArray = ["Miscellanea", "Culture", "Restaurant", "Museum", "Fast Food", "Asian Restaurant"]
    var id = ""
    var name = ""
    var descriptionPlace = ""
    var webAddress = ""
    var position: CLLocationCoordinate2D
    var image: Data?
    var imageName = ""
    var iconTable = ""
    
    //MARK: - Inits    
    init (name: String, descriptionPlace: String, webAddress: String, image_in: Data?, position: CLLocationCoordinate2D, imageName: String, iconTable: String) {
        self.id = UUID().uuidString
        self.name = name
        self.descriptionPlace = descriptionPlace
        self.webAddress = webAddress
        self.image = image_in
        self.position = position
        self.imageName = imageName
        self.iconTable = iconTable
    }    
    init (name: String, descriptionPlace: String, webAddress: String, position: CLLocationCoordinate2D, imageName: String, iconTable: String){
        self.id = UUID().uuidString
        self.name = name
        self.descriptionPlace = descriptionPlace
        self.webAddress = webAddress
        self.position = position
        self.imageName = imageName
        self.iconTable = iconTable
    }
}
