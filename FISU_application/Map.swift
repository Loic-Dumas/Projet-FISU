//
//  Map.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 22/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation
import MapKit

class Map {
    
    static private var map : Map? = nil
    
    static func getMap() -> Map {
        if(Map.map == nil) {
            Map.map = Map()
           }
        return Map.map!
    }
    
    var places : [Place] = [Place]()
    
    var placesAnnotation : [PlaceAnnotation] {
        get {
            var tmpPlacesAnnotation = [PlaceAnnotation]()
            for place in places {
                tmpPlacesAnnotation.append(PlaceAnnotation(title: place.title!, locationName: "Montpellier", type: (place.type?.name)!, coordinate: CLLocationCoordinate2D(latitude: place.latitude as! Double, longitude: place.longitude as! Double) , subtitle: (place.type?.name)!))
            }
            
            return tmpPlacesAnnotation
        }
    }
    
    var placeTypes : [PlaceType] = [PlaceType]()
    
    func addPlace(place: Place) {
        self.places.append(place)
    }
    
    var restaurants : [Restaurant] = [Restaurant]()
    
    private var restaurantSetPrivate : RestaurantSet?
    
    var restaurantSet : RestaurantSet {
        get {
            if restaurantSetPrivate == nil {
                restaurantSetPrivate = RestaurantSet()
                for restaurant in restaurants {
                    restaurantSetPrivate!.add(restaurant)
                }
            }
            return self.restaurantSetPrivate!
        }
    }
    
}