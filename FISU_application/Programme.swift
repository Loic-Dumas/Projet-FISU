//
//  Programme.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 22/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

class Programme {

    static func getTestProgramme() -> Programme {
        let p = Programme()
        let ski = Activity(name: "Ski", place: Place.montagne, begin: "02-23-2016 08:30", end: "02-23-2016 09:30")
        let conf = Activity(name: "Conf intro", place: Place.polytech, begin: "02-22-2016 08:30", end: "02-22-2016 11:30")
        let miam = Activity(name: "Repas", place: Place.com, begin: "02-23-2016 12:30", end: "02-23-2016 14:00")
        let rando = Activity(name: "Rando", place: Place.com, begin: "02-23-2016 10:30", end: "02-23-2016 11:00")
    
        p.addActivity(ski)
        p.addActivity(conf)
        p.addActivity(miam)
        p.addActivity(rando)
    
        return p
    }
    
    private var activityDays = [DayWithActivities]()

    init() {
    }
    
    func addActivity(activity : Activity) -> (dateIndex: Int, ActivityIndex: Int)? {

        var activityDay: DayWithActivities? = self.getActivityDay(activity.begin)
        guard activityDay != nil else {
            activityDay = DayWithActivities(day: activity.begin)
            activityDay!.addActivity(activity)
            self.activityDays.append(activityDay!)
            self.activityDays.sortInPlace({ (dayWithActivities1, dayWithActivities2) -> Bool in
                dayWithActivities1.isBefore(dayWithActivities2)
            })
            return (self.activityDays.indexOf(activityDay!)!, 0)
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