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

// Insert code here to add functionality to your managed object subclass
    
    
    
    func isBefore(activity : Activity) -> Bool {
        return self.beginning!.compare(activity.beginning!) == NSComparisonResult.OrderedAscending
    }
    
    func beginHourToString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.stringFromDate(self.beginning!)
        return dateString
    }
    
    func endHourToString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.stringFromDate(self.end!)
        return dateString
    }
    
    func dayToString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let dateString = dateFormatter.stringFromDate(self.beginning!)
        return dateString
    }

}
