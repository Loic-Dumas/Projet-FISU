//
//  DayWithActivities.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 24/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

class DayWithActivities : NSObject {
    var day : NSDate
    var activities : [Activity] = [Activity]()
    
    init(day : NSDate) {
        self.day = day
    }
    
    func addActivity(activity : Activity) -> Int? {
        guard !self.activities.contains(activity) else {
            return nil
        }
        self.activities.append(activity)
        self.activities.sortInPlace({ $0.isBefore($1) })
        return self.activities.indexOf(activity)
    }
    
    func getActivityAtIndex(index: Int) -> Activity? {
        guard index >= 0 && index < self.activities.count else {
            return nil
        }
        return self.activities[index]
    }
    
    func isBefore(dayWithActivities : DayWithActivities) -> Bool {
        return self.day.compare(dayWithActivities.day) == NSComparisonResult.OrderedAscending
    }
    
    func isSameDayThan(day: NSDate) -> Bool {
        let calendar = NSCalendar.currentCalendar()
        let day1 = calendar.components([.Day , .Month , .Year, .Hour, .Minute], fromDate: self.day)
        let day2 = calendar.components([.Day , .Month , .Year, .Hour, .Minute], fromDate: day)
        return day1.year == day2.year && day1.month == day2.month && day1.day == day2.day
    }
    
    func indexOf(activity: Activity) -> Int? {
        return self.activities.indexOf(activity)
    }
    
    func contains(activity: Activity) -> Bool {
        return self.activities.contains(activity)
    }
    
    func dayToString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let dateString = dateFormatter.stringFromDate(self.day)
        return dateString
    }
    
    func numberOfActivity() -> Int {
        return self.activities.count
    }
}