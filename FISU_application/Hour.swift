//
//  Hour.swift
//  FISU_application
//
//  Created by LoïcDumas on 10/03/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

class Hour {
    private var hourInternal : Int
    private var minuteInternal : Int
    
    private init(hour: Int, minute: Int) {
        self.hourInternal = hour
        self.minuteInternal = minute
    }
    
    static func createHour(hour hour: Int, minute: Int) -> Hour? {
        guard hour >= 0 && hour < 24 else {
            return nil
        }
        guard minute >= 0 && minute < 60 else {
            return nil
        }
        return Hour(hour: hour, minute: minute)
    }
    
    var hour : Int {
        get {
            return self.hourInternal
        }
    }
    var minute : Int {
        get {
            return self.minuteInternal
        }
    }
    
    func description() -> String {
        var result = ""
        if self.hour < 10 {
            result += "0"
        }
        result += String(self.hour)
        result += ":"
        if self.minute < 10 {
            result += "0"
        }
        result += String(self.minute)
        
        return result
        
    }
    
}
