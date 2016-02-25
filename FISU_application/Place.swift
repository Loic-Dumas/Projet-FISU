//
//  Place.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 22/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

class Place {
    
    static var montagne = Place(name: "Montagne")
    static var com = Place(name: "Comedie")
    static var polytech = Place(name: "Polytech")
    static var csu = Place(name: "CSU")
    
    var name : String
    
    init(name : String) {
        self.name = name
    }
}