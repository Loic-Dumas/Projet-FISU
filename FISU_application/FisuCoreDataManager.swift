//
//  FisuCoreDataManager.swift
//  FISU_application
//
//  Created by LoïcDumas on 24/03/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import UIKit
import CoreData

class FisuCoreDataManager {
    // FACTORY
    var entityActivity : NSEntityDescription
    
    var managedObjectContext : NSManagedObjectContext
    
    init() {
        self.managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        self.entityActivity = NSEntityDescription.entityForName("Activity", inManagedObjectContext: self.managedObjectContext)!
    }
    /*
    func buildActivity(name name : String, descriptionActivity : String, begin : NSDate, end : NSDate, going : Bool, category : ActivityCategory, location : Place, speakerSet : SpeakerSet) -> Activity {
        return Activity(entity: entityActivity, managedObjectContext: managedObjectContext, name: name, place: location, begin: begin, end: end)
    }
    */
    func loadData() -> Event {
        var event = Event(coreDataManager: self)
        
        //1 set the manageContext
        let managedContext = self.managedObjectContext
        
        //2.1 read and create PlaceTypes
        let fetchRequestPlaceType = NSFetchRequest(entityName: "PlaceType")
        
        do {
            if let results = try self.managedObjectContext.executeFetchRequest(fetchRequestPlaceType) as? [PlaceType]
            {
                event.map.placeTypes = results
            }
        }
        catch {
            fatalError("There was an error fetching the list of PlaceType! \(error)")
        }
        
        
        //2.2 read and create Place
        let fetchRequestPlace = NSFetchRequest(entityName: "Place")
        
        do {
            if let results = try self.managedObjectContext.executeFetchRequest(fetchRequestPlace) as? [Place]
            {
                event.map.places = results
            }
        }
        catch {
            fatalError("There was an error fetching the list of Place ! \(error)")
        }
        
        
        //2.3 read and create ActivityCategory
        let fetchRequestActivityCategory = NSFetchRequest(entityName: "ActivityCategory")
        
        do {
            if let results = try self.managedObjectContext.executeFetchRequest(fetchRequestActivityCategory) as? [ActivityCategory]
            {
                event.programme.activityCategory = results
            }
        }
        catch {
            fatalError("There was an error fetching the list of Place ! \(error)")
        }
        
        
        
        //2.4 read and create activities
        let fetchRequestActivity = NSFetchRequest(entityName: "Activity")
        
        var activities = [Activity]()
        do {
            let results = try managedContext.executeFetchRequest(fetchRequestActivity)
            activities = results as! [Activity]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        for activity in activities {
            event.programme.addActivity(activity)
        }
        
        
        
        
        if(activities.count == 0) {
            print("Creation of the CoreData")
            self.createData()
            event = self.loadData()
        }
        
        return event
    }
    
    func createData() {
            print("Nothing ! \nSo we add some default datas !")
            //2.1 create PlaceType
            let entityPlaceType =  NSEntityDescription.entityForName("PlaceType", inManagedObjectContext: self.managedObjectContext)
            
            
            let placeType1 = NSManagedObject(entity: entityPlaceType!, insertIntoManagedObjectContext: self.managedObjectContext)
            let placeType2 = NSManagedObject(entity: entityPlaceType!, insertIntoManagedObjectContext: self.managedObjectContext)
            let placeType3 = NSManagedObject(entity: entityPlaceType!, insertIntoManagedObjectContext: self.managedObjectContext)
            placeType1.setValue("Park", forKey: "name")
            placeType2.setValue("Conference place", forKey: "name")
            placeType3.setValue("Miscellaneous", forKey: "name")
            
            print("PlaceType added")
            
            
            //2.2 create Place
            let entityPlace =  NSEntityDescription.entityForName("Place", inManagedObjectContext:self.managedObjectContext)
            
            let place1 = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
            let place2 = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
            let place3 = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
            
            place1.setValue("Polytech", forKey: "title")
            place1.setValue("Engineering School", forKey: "subTitle")
            place1.setValue(43.632726, forKey: "latitude")
            place1.setValue(3.862590, forKey: "longitude")
            place1.setValue(placeType2, forKey: "type")
            
            place2.setValue("Comédie", forKey: "title")
            place2.setValue("Famous place in Montpellier", forKey: "subTitle")
            place2.setValue(43.608957, forKey: "latitude")
            place2.setValue(3.880332, forKey: "longitude")
            place2.setValue(placeType3, forKey: "type")
            
            place3.setValue("Palce du Peyrou", forKey: "title")
            place3.setValue("Nice garden", forKey: "subTitle")
            place3.setValue(43.611304, forKey: "latitude")
            place3.setValue(3.870713, forKey: "longitude")
            place3.setValue(placeType1, forKey: "type")
            
            print("Place added")
            
            
            //2.3 create ActivityCategory
            let entityActivityCategory =  NSEntityDescription.entityForName("ActivityCategory", inManagedObjectContext:self.managedObjectContext)
            
            let activityCategory1 = NSManagedObject(entity: entityActivityCategory!, insertIntoManagedObjectContext: self.managedObjectContext)
            let activityCategory2 = NSManagedObject(entity: entityActivityCategory!, insertIntoManagedObjectContext: self.managedObjectContext)
            let activityCategory3 = NSManagedObject(entity: entityActivityCategory!, insertIntoManagedObjectContext: self.managedObjectContext)
            activityCategory1.setValue("Sport", forKey: "name")
            activityCategory2.setValue("Conference", forKey: "name")
            activityCategory3.setValue("Miscellaneous", forKey: "name")
            
        print("ActivityCategory added")
        
        
        //2.4 Create the Speaker
        let entitySpeaker =  NSEntityDescription.entityForName("Speaker", inManagedObjectContext:self.managedObjectContext)
        
        let speaker1 = NSManagedObject(entity: entitySpeaker!, insertIntoManagedObjectContext: self.managedObjectContext)
        let speaker2 = NSManagedObject(entity: entitySpeaker!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        speaker1.setValue("Julien", forKey: "name")
        speaker1.setValue("Director of FISU", forKey: "descriptionSpeaker")
        speaker2.setValue("Clément", forKey: "name")
        speaker2.setValue("Organisator", forKey: "descriptionSpeaker")
        
        var speakerTable : [NSManagedObject] = []
        speakerTable.append(speaker1)
        speakerTable.append(speaker2)
        let speakers = NSSet(array: speakerTable)
        
        //2.5 Create the Activity
        let entityActivity =  NSEntityDescription.entityForName("Activity", inManagedObjectContext:self.managedObjectContext)
        
        let activity1 = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activity2 = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activity3 = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        
        activity1.setValue("Welcoming", forKey: "name")
        activity1.setValue("This description is fort the welcoming, LoremExsistit autem hoc loco quaedam quaestio subdifficilis, num quando amici novi, digni amicitia", forKey: "descriptionActivity")
        activity1.setValue(NSDate(), forKey: "beginning")
        activity1.setValue(NSDate(), forKey: "ending")
        activity1.setValue(place1, forKey: "location")
        activity1.setValue(activityCategory1, forKey: "category")
        activity1.setValue(speakers, forKey: "speakers")
        
        activity2.setValue("Free time", forKey: "name")
        activity2.setValue("Discover a famus place in Montpellier.", forKey: "descriptionActivity")
        activity2.setValue(NSDate(), forKey: "beginning")
        activity2.setValue(NSDate(), forKey: "ending")
        activity2.setValue(place2, forKey: "location")
        activity2.setValue(activityCategory2, forKey: "category")
        
        activity3.setValue("Running", forKey: "name")
        activity3.setValue("A short run to start the FISU.", forKey: "descriptionActivity")
        activity3.setValue(NSDate(), forKey: "beginning")
        activity3.setValue(NSDate(), forKey: "ending")
        activity3.setValue(place3, forKey: "location")
        activity3.setValue(activityCategory3, forKey: "category")
        
        print("activity added")
        
            //3 Save
            do {
                try self.managedObjectContext.save()
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
    }
}

