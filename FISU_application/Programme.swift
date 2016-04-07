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
        let coreDataManager = FisuCoreDataManager()
        let p = Programme(coreDataManager: coreDataManager)
        /*
        p.addActivity(Activity(name: "Openning ceremony", place: Place.polytech, begin: "07-04-2016 09:00", end: "07-04-2016 12:30"))
        p.addActivity(Activity(name: "Lunch", place: Place.polytech, begin: "07-04-2016 12:30", end: "07-04-2016 13:45"))
        p.addActivity(Activity(name: "UNESCO session", place: Place.polytech, begin: "07-04-2016 13:45", end: "07-04-2016 14:30"))
        p.addActivity(Activity(name: "Introduction to the week's aims/methodology", place: Place.polytech, begin: "07-04-2016 14:15", end: "07-04-2016 15:15"))
        p.addActivity(Activity(name: "Coffee break", place: Place.polytech, begin: "07-04-2016 15:15", end: "07-04-2016 15:30"))
        p.addActivity(Activity(name: "Definition of project working groups", place: Place.polytech, begin: "07-04-2016 15:30", end: "07-04-2016 16:30"))
        p.addActivity(Activity(name: "Transition to ice-breaking activity", place: Place.polytech, begin: "07-04-2016 16:30", end: "07-04-2016 17:00"))
        p.addActivity(Activity(name: "Boules/pétanque", place: Place.polytech, begin: "07-04-2016 17:00", end: "07-04-2016 19:00"))
        p.addActivity(Activity(name: "Transition/closing change", place: Place.polytech, begin: "07-04-2016 19:00", end: "07-04-2016 19:45"))
        p.addActivity(Activity(name: "Official reception/opening dinner", place: Place.polytech, begin: "07-04-2016 19:45", end: "07-04-2016 22:00"))
        
        p.addActivity(Activity(name: "Plenary session: Values/Ethics/Integrity", place: Place.polytech, begin: "07-05-2016 09:00", end: "07-05-2016 10:00"))
        p.addActivity(Activity(name: "Workshops: Values/Ethics/Integrity", place: Place.polytech, begin: "07-05-2016 10:00", end: "07-05-2016 11:00"))
        p.addActivity(Activity(name: "Coffee break", place: Place.polytech, begin: "07-05-2016 11:15", end: "07-05-2016 11:30"))
        p.addActivity(Activity(name: "Project working session", place: Place.polytech, begin: "07-05-2016 11:30", end: "07-05-2016 12:30"))
        p.addActivity(Activity(name: "Lunch", place: Place.polytech, begin: "07-05-2016 12:30", end: "07-05-2016 13:45"))
        p.addActivity(Activity(name: "Plenary session: Health/Social Care/Anti-doping", place: Place.polytech, begin: "07-05-2016 13:45", end: "07-05-2016 14:45"))
        p.addActivity(Activity(name: "Workshops Health/Social Care/Anti-doping", place: Place.polytech, begin: "07-05-2016 14:45", end: "07-05-2016 15:45"))
        p.addActivity(Activity(name: "Coffee break", place: Place.polytech, begin: "07-05-2016 15:45", end: "07-05-2016 16:00"))
        p.addActivity(Activity(name: "Transition to cultural activity", place: Place.polytech, begin: "07-05-2016 16:00", end: "07-05-2016 16:30"))
        p.addActivity(Activity(name: "Visit of Montpellier", place: Place.polytech, begin: "07-05-2016 16:30", end: "07-05-2016 18:30"))
        p.addActivity(Activity(name: "Dinner", place: Place.polytech, begin: "07-05-2016 19:45", end: "07-05-2016 21:30"))
        
        p.addActivity(Activity(name: "Plenary session: Leadership", place: Place.polytech, begin: "07-06-2016 09:00", end: "07-06-2016 10:00"))
        */
    
        return p
    }
    
    private var activityDays = [DayWithActivities]()
    var activityCategory = [ActivityCategory]()
    var coreDataManager: FisuCoreDataManager
    
    init(coreDataManager : FisuCoreDataManager) {
        self.coreDataManager = coreDataManager
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
    /*
    func buildActivity(name name : String, descriptionActivity : String, begin : NSDate, end : NSDate, going : Bool, category : ActivityCategory, location : Place, speakerSet : SpeakerSet) -> Activity {
        var newActivity = self.coreDataManager.buildActivity(name: name, descriptionActivity : descriptionActivity, begin : begin, end : end, going : going, category : category, location : location, speakerSet : speakerSet)
        
        return newActivity
    }
    */
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