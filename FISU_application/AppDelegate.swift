//
//  AppDelegate.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 22/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var event = Event()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.event.programme = Programme.getTestProgramme()
        
        
        //1 set the manageContext
        let managedContext = self.managedObjectContext
        
        //2.1 read and create PlaceTypes
        let fetchRequestPlaceType = NSFetchRequest(entityName: "PlaceType")
        
        do {
            if let results = try self.managedObjectContext.executeFetchRequest(fetchRequestPlaceType) as? [PlaceType]
            {
                self.event.map.placeTypes = results
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
                self.event.map.places = results
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
                self.event.programme.activityCategory = results
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
            self.event.programme.addActivity(activity)
        }
        
        
        
        
        
        
//        //2.4 read and create activities
//        let fetchRequest = NSFetchRequest(entityName: "Activity")
//        
//        var activities = [NSManagedObject]()
//        do {
//            let results = try managedContext.executeFetchRequest(fetchRequest)
//            activities = results as! [NSManagedObject]
//        } catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//        }
        if(activities.count <= 0) {
            print("Nothing ! \nSo we add some default datas !")
            //2.1 create PlaceType
            let entityPlaceType =  NSEntityDescription.entityForName("PlaceType", inManagedObjectContext:managedContext)
            
            let placeType1 = NSManagedObject(entity: entityPlaceType!, insertIntoManagedObjectContext: managedContext)
            let placeType2 = NSManagedObject(entity: entityPlaceType!, insertIntoManagedObjectContext: managedContext)
            let placeType3 = NSManagedObject(entity: entityPlaceType!, insertIntoManagedObjectContext: managedContext)
            placeType1.setValue("Park", forKey: "name")
            placeType2.setValue("Conference place", forKey: "name")
            placeType3.setValue("Miscellaneous", forKey: "name")
            
            print("PlaceType added")
            
            
            //2.2 create PlaceType
            let entityPlace =  NSEntityDescription.entityForName("Place", inManagedObjectContext:managedContext)
            
            let place1 = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: managedContext)
            let place2 = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: managedContext)
            let place3 = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: managedContext)
            
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
            let entityActivityCategory =  NSEntityDescription.entityForName("ActivityCategory", inManagedObjectContext:managedContext)
            
            let activityCategory1 = NSManagedObject(entity: entityActivityCategory!, insertIntoManagedObjectContext: managedContext)
            let activityCategory2 = NSManagedObject(entity: entityActivityCategory!, insertIntoManagedObjectContext: managedContext)
            let activityCategory3 = NSManagedObject(entity: entityActivityCategory!, insertIntoManagedObjectContext: managedContext)
            activityCategory1.setValue("Sport", forKey: "name")
            activityCategory2.setValue("Conference", forKey: "name")
            activityCategory3.setValue("Miscellaneous", forKey: "name")
            
            print("ActivityCategory added")
            
            
            //2.4 Create the activity
            let entityActivity =  NSEntityDescription.entityForName("Activity", inManagedObjectContext:managedContext)
            
            let activity1 = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: managedContext)
            let activity2 = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: managedContext)
            let activity3 = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: managedContext)
            
            activity1.setValue("Welcoming", forKey: "name")
            activity1.setValue("This description is fort the welcoming, LoremExsistit autem hoc loco quaedam quaestio subdifficilis, num quando amici novi, digni amicitia", forKey: "descriptionActivity")
            activity1.setValue(NSDate(), forKey: "beginning")
            activity1.setValue(NSDate(), forKey: "end")
            activity1.setValue(place1, forKey: "locate")
            activity1.setValue(activityCategory1, forKey: "category")
            
            activity2.setValue("Free time", forKey: "name")
            activity2.setValue("Discover a famus place in Montpellier.", forKey: "descriptionActivity")
            activity2.setValue(NSDate(), forKey: "beginning")
            activity2.setValue(NSDate(), forKey: "end")
            activity2.setValue(place2, forKey: "locate")
            activity1.setValue(activityCategory2, forKey: "category")
            
            activity3.setValue("Running", forKey: "name")
            activity3.setValue("A short run to start the FISU.", forKey: "descriptionActivity")
            activity3.setValue(NSDate(), forKey: "beginning")
            activity3.setValue(NSDate(), forKey: "end")
            activity3.setValue(place3, forKey: "locate")
            activity1.setValue(activityCategory3, forKey: "category")
    
            print("activity added")
        
            
            //3 Save
            do {
                try managedContext.save()
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "polytech.FISU_application" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("FISU_application", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("tmp9.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }

        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

