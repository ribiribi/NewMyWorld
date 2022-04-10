//
//  Place+json.swift
//  MyWorld
//
//  Created by user143594 on 11/26/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import MapKit


extension Place{
    enum PlaceKeys: String, CodingKey {
        case name = "name"
        case descriptionPlace = "descriptionPlace"
        case webAddress = "webAddress"
        case latitude = "latitude"
        case longitude = "longitude"
        case imageName = "imageName"
        case iconTable = "iconTable"
    }
    
    convenience init(from: Decoder) throws {   //whats mean required convenience????
        let container = try from.container(keyedBy: PlaceKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let descriptionPlace = try container.decode(String.self, forKey: .descriptionPlace)
        let webAddress = try container.decode(String.self, forKey: .webAddress)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        let position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let imageName = try container.decode(String.self, forKey: .imageName)
        let iconTable = try container.decode(String.self, forKey: .iconTable)
        
        self.init(name: name, descriptionPlace: descriptionPlace, webAddress: webAddress, position: position, imageName: imageName, iconTable: iconTable)
    }
    
    func encode(to: Encoder) throws {
        var container = to.container(keyedBy: PlaceKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(descriptionPlace, forKey: .descriptionPlace)
        try container.encode(webAddress, forKey: .webAddress)
        try container.encode(position.latitude, forKey: .latitude)
        try container.encode(position.longitude, forKey: .longitude)
        try container.encode(imageName, forKey: .imageName)
        try container.encode(iconTable, forKey: .iconTable)
    }
}
//Extension required by MKAnnotation
extension Place: MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D{
        return position
    }
    
    var title: String?{
        return name
    }
}
