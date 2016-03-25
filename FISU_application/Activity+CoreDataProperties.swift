//
//  Activity+CoreDataProperties.swift
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

extension Activity {

    @NSManaged var beginning: NSDate?
    @NSManaged var descriptionActivity: String?
    @NSManaged var end: NSDate?
    @NSManaged var going: NSNumber?
    @NSManaged var name: String?
    @NSManaged var locate: Place?
    @NSManaged var speakers: NSSet?

}
