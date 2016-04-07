//
//  Event.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 22/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

class Event {
    var programme : Programme
    var restaurants : [Restaurant] = [Restaurant]()
    var map : Map = Map()
    
    init(coreDataManager : FisuCoreDataManager) {
        self.programme = Programme(coreDataManager : coreDataManager)
    }
}