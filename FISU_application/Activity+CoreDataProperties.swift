//
//  Activity+CoreDataProperties.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 05/04/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Activity {
    
    @NSManaged var beginning: NSTimeInterval
    @NSManaged var descriptionActivity: String?
    @NSManaged var ending: NSTimeInterval
    @NSManaged var going: Bool
    @NSManaged var name: String?
    @NSManaged var category: ActivityCategory?
    @NSManaged var location: Place?
    @NSManaged var speakers: NSSet?
    
}
