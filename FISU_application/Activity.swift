//
//  Activity.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 22/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

class Activity : NSObject {

    static var ski = Activity(name: "Ski", place: Place.montagne, begin: "02-23-2016 08:30", end: "02-23-2016 09:30")
    static var conf = Activity(name: "Conf intro", place: Place.polytech, begin: "02-22-2016 08:30", end: "02-23-2016 11:30")
    static var miam = Activity(name: "Repas", place: Place.com, begin: "02-23-2016 12:30", end: "02-23-2016 14:00")
    
    var name : String
    var begin : NSDate
    var end : NSDate
    var place : Place
    
    init(name : String, place : Place, begin : NSDate, end : NSDate){
        self.name = name
        self.place = place
        self.begin = begin
        self.end = end
    }
    
    init(name : String, place : Place, begin : String, end : String) {
        self.name = name
        self.place = place
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        // convert string into date
        self.begin = dateFormatter.dateFromString(begin) as NSDate!
        self.end = dateFormatter.dateFromString(end) as NSDate!
    }
    
    func isBefore(activity : Activity) -> Bool {
        return self.begin.compare(activity.begin) == NSComparisonResult.OrderedAscending
    }
    
    func beginHourToString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        let dateString = dateFormatter.stringFromDate(self.begin)
        return dateString
    }
}