//
//  Place.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 22/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    
    static var montagne = Place(title: "Montagne", latitude: 40, longitude: 2)
    static var com = Place(title: "Comedie", latitude: 43, longitude: 4)
    static var polytech = Place(title: "Polytech", latitude: 43.6109200, longitude: 3.8772300)
    static var csu = Place(title: "CSU", latitude: 43.5, longitude: 3.6)
    
    @objc var title : String?
    @objc var coordinate : CLLocationCoordinate2D
    
    init(title: String, latitude: Double, longitude: Double) {
        self.title = title
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var latitude : Double {
        get {
            return self.coordinate.latitude;
        }
    }
    
    var longitude : Double {
        get {
            return self.coordinate.longitude;
        }
    }
    
    @objc var subtitle: String? {
        return self.title
    }
}