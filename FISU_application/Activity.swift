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
        dateFormatter.dateFormat = "MMMM dd"
        let dateString = dateFormatter.stringFromDate(self.begin)
        return dateString
    }
    
    func dayToStringWithYear() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let dateString = dateFormatter.stringFromDate(self.begin)
        return dateString
    }

}

