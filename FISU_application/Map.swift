//
//  Map.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 22/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

class Map {
    
    static private var map : Map? = nil
    
    static func getMap() -> Map {
        if(Map.map == nil) {
            Map.map = Map()
           }
        return Map.map!
    }
    
    var places : [Place] = [Place]()
    
    var placeTypes : [PlaceType] = [PlaceType]()
    
    func addPlace(place: Place) {
        self.places.append(place)
    }
}