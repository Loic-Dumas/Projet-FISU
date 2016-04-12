//
//  Place Annotation.swift
//  FISU_application
//
//  Created by LoïcDumas on 10/04/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation
import MapKit

// PlaceAnnotation is the facade between the places and the Map.
// Like this class implements MKAnnotation we can draw pins on the MapViews
class PlaceAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let type: String
    let coordinate: CLLocationCoordinate2D
    private var privateSubTitle : String? = nil
    
    init(title: String, locationName: String, type: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.type = type
        self.coordinate = coordinate
        
        super.init()
    }
    
    init(title: String, locationName: String, type: String, coordinate: CLLocationCoordinate2D, subtitle : String) {
        self.title = title
        self.locationName = locationName
        self.type = type
        self.coordinate = coordinate
        self.privateSubTitle = subtitle
        
        super.init()
    }
    
    var subtitle: String? {
        guard self.privateSubTitle != nil else {
            return locationName
        }
        return self.privateSubTitle
    }
    
}