//
//  Hour+CoreDataProperties.swift
//  FISU_application
//
//  Created by LoïcDumas on 24/03/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Hour {
    @NSManaged var hour: NSNumber?
    @NSManaged var minute: NSNumber?
    
    /*
    private var hourInternal : NSNumber
    private var minuteInternal : NSNumber
    
    @NSManaged var hour: NSNumber? {
        get {
            return self.hourInternal
        }
        set {
            guard let newHour = newValue && newValue?.intValue >= 0 && newValue?.intValue < 24 else {
                return
            }
            self.hourInternal = newHour
        }
    }
    @NSManaged var minute: NSNumber? {
        get {
            return self.minuteInternal
        }
        set {
            guard let newMinute = newValue && newValue >= 0 && newValue < 60 else {
                return
            }
            self.minuteInternal = newMinute
        }
    }
*/

}
