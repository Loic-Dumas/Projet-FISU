//
//  Programme.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 22/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

// Class who represent the program.
// A program have a set of DayWithActivities
// A DayWithActivities is a day with a set of activities
// The fonctionnalities of a Program are :
// - add an activity
// - get the dayWithActivities corresponding at a day
// - get the index'st activity of the DayWithActivity with the day in parameter
// - get the activity with an index for the DayWithActivity and an index for the activity (into the DayWithActivity)
// - get the DayWithActivity with an index
// - get the number of day (the same than the number of DayWithActivity)
// - get the number of activity for a day
// - get the number of activity for an index
// - get the index of an activity
class Programme {
    
    private var activityDays = [DayWithActivities]()
    var activityCategory = [ActivityCategory]()
    
    init() {
    }
    
    func addActivity(activity : Activity) -> (dateIndex: Int, ActivityIndex: Int)? {

        var activityDay: DayWithActivities? = self.getActivityDay(activity.begin)
        guard activityDay != nil else {
            let day = activity.begin.copy() as! NSDate
            activityDay = DayWithActivities(day: day)
            activityDay!.addActivity(activity)
            self.activityDays.append(activityDay!)
            self.activityDays.sortInPlace({ (dayWithActivities1, dayWithActivities2) -> Bool in
                dayWithActivities1.isBefore(dayWithActivities2)
            })
            return (self.activityDays.indexOf(activityDay!)!, 0)
        }
        guard activityDay?.contains(activity) == false else {
            return nil
        }
        
        let activityIndex = activityDay!.addActivity(activity)
        let dateIndex = self.activityDays.indexOf(activityDay!)

        return (dateIndex!, activityIndex!)
    }
    
    
    func getActivityDay(day: NSDate) -> DayWithActivities? {
        var activityDay: DayWithActivities? = nil
        for activityDayTemp in self.activityDays {
            if activityDayTemp.isSameDayThan(day) {
                activityDay = activityDayTemp
            }
        }
        return activityDay
    }
    
    func getAtDate(date: NSDate, index : Int) -> Activity? {
        let activityDay = self.getActivityDay(date)
        guard let _ = activityDay else {
            return nil
        }
        return activityDay!.getActivityAtIndex(index)
    }
    
    func getAtIndex(dateIndex: Int, activityIndex : Int) -> Activity? {
        guard dateIndex >= 0 && dateIndex < self.activityDays.count else {
            return nil
        }
        return self.activityDays[dateIndex].getActivityAtIndex(activityIndex)
    }
    
    func getAtIndex(dateIndex: Int) -> DayWithActivities? {
        guard dateIndex >= 0 && dateIndex < self.activityDays.count else {
            return nil
        }
        return self.activityDays[dateIndex]
    }
    
    func numberOfDays() -> Int {
        return self.activityDays.count;
    }
    
    func numberOfActivityForDay(date: NSDate) -> Int {
        let activityDay = self.getActivityDay(date)
        guard let _ = activityDay else {
            return 0
        }
        return activityDay!.activities.count
    }
    
    func numberOfActivityForDay(section: Int) -> Int? {
        guard section >= 0 && section < self.activityDays.count else {
            return nil
        }
        return self.activityDays[section].activities.count
    }
    
    func getIndexOf(activity : Activity, day: NSDate) -> Int? {
        let activityDay = self.getActivityDay(day)
        guard let _ = activityDay else {
            return nil
        }
        return activityDay!.indexOf(activity)
    }
}