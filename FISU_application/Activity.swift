//
//  Activity.swift
//  FISU_application
//
//  Created by LoïcDumas on 24/03/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation
import CoreData


class Activity: NSManagedObject {
    private var speakerSetPrivate : SpeakerSet?
    
    /*
    
    init(entity: NSEntityDescription, managedObjectContext: NSManagedObjectContext, name : String, place : Place, beginString : String, endString : String) {
        super.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
        
        self.name = name
        self.location = place
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        // convert string into date
        self.begin = dateFormatter.dateFromString(beginString) as NSDate!
        self.end = dateFormatter.dateFromString(endString) as NSDate!
    }
    
    init(entity: NSEntityDescription, managedObjectContext: NSManagedObjectContext, name : String, place : Place, begin : NSDate, end : NSDate) {
        super.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
        self.name = name
        self.location = place
        
        self.begin = begin
        self.end = end
    }
 */   
 
    var begin : NSDate {
        get {
            return NSDate(timeIntervalSince1970: self.beginning)
        }
        set {
            self.beginning = newValue.timeIntervalSince1970
        }
    }
    
    var end : NSDate {
        get {
            return NSDate(timeIntervalSince1970: self.ending)
        }
        set {
            self.ending = newValue.timeIntervalSince1970
        }
    }
    
    var speakerSet : SpeakerSet {
        get {
            if speakerSetPrivate == nil {
                speakerSetPrivate = SpeakerSet()
                for speaker in speakers! {
                    speakerSetPrivate!.add(speaker as! Speaker)
                }
            }
            return self.speakerSetPrivate!
        }
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
