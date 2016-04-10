//
//  RestaurantSet.swift
//  FISU_application
//
//  Created by LoïcDumas on 09/04/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

class RestaurantSet {
    var restaurants = [Restaurant]()
    
    func getAtIndex(index : Int) -> Restaurant? {
        guard index >= 0 && index < self.restaurants.count else {
            return nil
        }
        return self.restaurants[index]
    }
    
    func add(speaker : Restaurant) -> Int {
        guard !self.restaurants.contains(speaker) else {
            return self.restaurants.indexOf(speaker)!
        }
        self.restaurants.append(speaker)
        return self.restaurants.indexOf(speaker)!
    }
    
    func count() -> Int {
        return self.restaurants.count
    }
}
