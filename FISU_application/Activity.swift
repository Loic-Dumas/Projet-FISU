//
//  Activity.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 22/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

class Activity : NSObject {
    
    var name : String
    var begin : NSDate
    var end : NSDate
    var place : Place
    var speakerSet = SpeakerSet()
    
    /*
    init(name : String, place : Place, begin : NSDate, end : NSDate){
        self.name = name
        self.place = place
        self.begin = begin
        self.end = end
    }
    */
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
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.stringFromDate(self.begin)
        return dateString
    }
    
    func endHourToString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.stringFromDate(self.end)
        return dateString
    }
    
    func dayToString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let dateString = dateFormatter.stringFromDate(self.begin)
        return dateString
    }
   
}