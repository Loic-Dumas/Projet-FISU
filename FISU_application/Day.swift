//
//  Day.swift
//  FISU_application
//
//  Created by LoïcDumas on 10/03/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

class Day {
    static let Monday = Day(day: "Monday", value: 0)
    static let Tuesday = Day(day: "Tuesday", value: 1)
    static let Wednesday = Day(day: "Wednesday", value: 2)
    static let Thursday = Day(day: "Thursday", value: 3)
    static let Friday = Day(day: "Friday", value: 4)
    static let Saturday = Day(day: "Saturday", value: 5)
    static let Sunday = Day(day: "Sunday", value: 6)
    static let Days = [Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday]
    
    
    private var dayInternal : String
    private var valueInternal : Int
    
    private init(day: String, value: Int) {
        self.dayInternal = day
        self.valueInternal = value
    }
    
    var day : String{
        get {
            return self.dayInternal
        }
    }
    
    
    var value : Int{
        get {
            return self.valueInternal
        }
    }
    
    static func getDayWithValue(val : Int) -> Day? {
        var result : Day?
        if val >= 0 && val < 7 {
            result = Days[val]
        }
        else {
            result = nil
        }
        return result
    }
    
}