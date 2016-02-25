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
        self.activities.sortInPlace({(activity1, activity2) -> Bool in
            activity1.isBefore(activity2)
        })
        return self.activities.indexOf(activity)
    }
    
    func getActivityAtIndex(index: Int) -> Activity? {
        guard index >= 0 && index < self.activities.count else {
            return nil
        }
        return self.activities[index]
    }
    
    func isBefore(dayWithActivities : DayWithActivities) -> Bool {
        let calendar = NSCalendar.currentCalendar()
        let day1 = calendar.components([.Day , .Month , .Year, .Hour, .Minute], fromDate: self.day)
        let day2 = calendar.components([.Day , .Month , .Year, .Hour, .Minute], fromDate: dayWithActivities.day)
        return (day1.year <= day2.year && day1.month <= day2.month && day1.day < day2.day)
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
    
    func dayToString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let dateString = dateFormatter.stringFromDate(self.day)
        return dateString
    }
}