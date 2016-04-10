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
        
        //2.1 load PlaceTypes
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
        
        
        //2.2 load Place
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
        
        
        //2.3 load ActivityCategory
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
        
        
        
        //2.4 load activities
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
        
        
        
        //2.5 load restaurant
        let fetchRequestRestaurant = NSFetchRequest(entityName: "Restaurant")
        
        do {
            if let results = try self.managedObjectContext.executeFetchRequest(fetchRequestRestaurant) as? [Restaurant]
            {
                event.map.restaurants = results
            }
        }
        catch {
            fatalError("There was an error fetching the list of Place ! \(error)")
        }
        
//        
//        for restaurant in event.map.restaurants {
//            print("restau : " + restaurant.name! )
//        }
        
        
        
        
        // we don't load for Speakers, DailySchedule, Hour
        
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
        let placeType4 = NSManagedObject(entity: entityPlaceType!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeTypeRestaurant = NSManagedObject(entity: entityPlaceType!, insertIntoManagedObjectContext: self.managedObjectContext)
        placeType1.setValue("Park", forKey: "name")
        placeType2.setValue("Conference place", forKey: "name")
        placeType3.setValue("Miscellaneous", forKey: "name")
        placeType4.setValue("River", forKey: "name")
        placeTypeRestaurant.setValue("Restaurant", forKey: "name")
        
        
        //2.2 create Place
        let entityPlace =  NSEntityDescription.entityForName("Place", inManagedObjectContext:self.managedObjectContext)
        
        let place1 = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let place2 = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let place3 = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeLez = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeRestauLuigi = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeRestau3Brasseurs = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeRestoU = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        
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
        
        place3.setValue("Place du Peyrou", forKey: "title")
        place3.setValue("Nice garden", forKey: "subTitle")
        place3.setValue(43.611304, forKey: "latitude")
        place3.setValue(3.870713, forKey: "longitude")
        place3.setValue(placeType1, forKey: "type")
        
        placeLez.setValue("Rives du Lez", forKey: "title")
        placeLez.setValue("Le lez, tumultueux et impétueux fleuves. Attention, contient des déchets toxiques, ne pas se baingner", forKey: "subTitle")
        placeLez.setValue(43.607505, forKey: "latitude")
        placeLez.setValue(3.897319, forKey: "longitude")
        placeLez.setValue(placeType4, forKey: "type")
        
        placeRestauLuigi.setValue("Chez Luigi", forKey: "title")
        placeRestauLuigi.setValue("Pizzeria", forKey: "subTitle")
        placeRestauLuigi.setValue(43.61304, forKey: "latitude")
        placeRestauLuigi.setValue(3.87013, forKey: "longitude")
        placeRestauLuigi.setValue(placeTypeRestaurant, forKey: "type")
        
        placeRestau3Brasseurs.setValue("3 brasseurs", forKey: "title")
        placeRestau3Brasseurs.setValue("Brasserie", forKey: "subTitle")
        placeRestau3Brasseurs.setValue(43.604230, forKey: "latitude")
        placeRestau3Brasseurs.setValue(3.914409, forKey: "longitude")
        placeRestau3Brasseurs.setValue(placeTypeRestaurant, forKey: "type")
        
        placeRestoU.setValue("Restaurant Universiataire", forKey: "title")
        placeRestoU.setValue("Self", forKey: "subTitle")
        placeRestoU.setValue(43.631093, forKey: "latitude")
        placeRestoU.setValue( 3.860330, forKey: "longitude")
        placeRestoU.setValue(placeTypeRestaurant, forKey: "type")
        
        
        //2.3 create ActivityCategory
        let entityActivityCategory =  NSEntityDescription.entityForName("ActivityCategory", inManagedObjectContext:self.managedObjectContext)
        
        let activityCategory1 = NSManagedObject(entity: entityActivityCategory!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activityCategory2 = NSManagedObject(entity: entityActivityCategory!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activityCategory3 = NSManagedObject(entity: entityActivityCategory!, insertIntoManagedObjectContext: self.managedObjectContext)
        activityCategory1.setValue("Sport", forKey: "name")
        activityCategory2.setValue("Conference", forKey: "name")
        activityCategory3.setValue("Miscellaneous", forKey: "name")
        
        
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
        let activity4 = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activity5 = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        
        activity1.setValue("Welcoming", forKey: "name")
        activity1.setValue("This description is fort the welcoming, LoremExsistit autem hoc loco quaedam quaestio subdifficilis, num quando amici novi, digni amicitia", forKey: "descriptionActivity")
        activity1.setValue(stringToDate("06-11-2016 15:30"), forKey: "beginning")
        activity1.setValue(stringToDate("06-11-2016 16:30"), forKey: "ending")
        activity1.setValue(place1, forKey: "location")
        activity1.setValue(activityCategory2, forKey: "category")
        activity1.setValue(speakers, forKey: "speakers")
        
        activity2.setValue("Free time", forKey: "name")
        activity2.setValue("Discover a famus place in Montpellier.", forKey: "descriptionActivity")
        activity2.setValue(stringToDate("06-12-2016 09:30"), forKey: "beginning")
        activity2.setValue(stringToDate("06-12-2016 10:30"), forKey: "ending")
        activity2.setValue(place2, forKey: "location")
        activity2.setValue(activityCategory3, forKey: "category")
        
        activity3.setValue("Running", forKey: "name")
        activity3.setValue("A short run to start the FISU.", forKey: "descriptionActivity")
        activity3.setValue(stringToDate("06-12-2016 15:30"), forKey: "beginning")
        activity3.setValue(stringToDate("06-12-2016 15:30"), forKey: "ending")
        activity3.setValue(place3, forKey: "location")
        activity3.setValue(activityCategory1, forKey: "category")
        
        activity4.setValue("Closing Ceremony", forKey: "name")
        activity4.setValue("This was a really great FISU for 2016, now it's time for a wonderfull closing ceremony", forKey: "descriptionActivity")
        activity4.setValue(stringToDate("06-13-2016 19:15"), forKey: "beginning")
        activity4.setValue(stringToDate("06-13-2016 15:30"), forKey: "ending")
        activity4.setValue(place1, forKey: "location")
        activity4.setValue(activityCategory1, forKey: "category")
        activity4.setValue(speakers, forKey: "speakers")
        
        activity5.setValue("Kayak", forKey: "name")
        activity5.setValue("Race in Kayak. Prepare your short and sunglasses, because it's raining.", forKey: "descriptionActivity")
        activity5.setValue(stringToDate("06-12-2016 14:00"), forKey: "beginning")
        activity5.setValue(stringToDate("06-12-2016 16:30"), forKey: "ending")
        activity5.setValue(placeLez, forKey: "location")
        activity5.setValue(activityCategory1, forKey: "category")
        
        
        //2.6 Create hour
        let entityHour =  NSEntityDescription.entityForName("Hour", inManagedObjectContext:self.managedObjectContext)
        
        let hour11_00 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        let hour12_00 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        let hour12_30 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        let hour13_00 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        let hour13_30 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        let hour14_00 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        let hour14_30 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        let hour19_00 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        let hour19_30 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        let hour20_00 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        let hour20_30 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        let hour21_00 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        let hour22_00 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        let hour23_00 = NSManagedObject(entity: entityHour!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        hour11_00.setValue(11, forKey: "hour"); hour11_00.setValue(0, forKey: "minute")
        hour12_00.setValue(12, forKey: "hour"); hour12_00.setValue(0, forKey: "minute")
        hour12_30.setValue(12, forKey: "hour"); hour12_30.setValue(30, forKey: "minute")
        hour13_00.setValue(13, forKey: "hour"); hour13_00.setValue(0, forKey: "minute")
        hour13_30.setValue(13, forKey: "hour"); hour13_30.setValue(30, forKey: "minute")
        hour14_00.setValue(14, forKey: "hour"); hour14_00.setValue(0, forKey: "minute")
        hour14_30.setValue(14, forKey: "hour"); hour14_30.setValue(30, forKey: "minute")
        
        hour19_00.setValue(19, forKey: "hour"); hour19_00.setValue(0, forKey: "minute")
        hour19_30.setValue(19, forKey: "hour"); hour19_30.setValue(30, forKey: "minute")
        hour20_00.setValue(20, forKey: "hour"); hour20_00.setValue(0, forKey: "minute")
        hour21_00.setValue(20, forKey: "hour"); hour20_30.setValue(30, forKey: "minute")
        hour21_00.setValue(21, forKey: "hour"); hour21_00.setValue(0, forKey: "minute")
        hour22_00.setValue(22, forKey: "hour"); hour22_00.setValue(0, forKey: "minute")
        hour23_00.setValue(23, forKey: "hour"); hour23_00.setValue(0, forKey: "minute")
        
        
        //2.7 Create DailySchedule
        let entityDailySchedule =  NSEntityDescription.entityForName("DailySchedule", inManagedObjectContext:self.managedObjectContext)
        
        let monday1 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        let tuesday1 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        let wednesday1 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        let thursday1 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        let friday1 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        let saturday1 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        let sunday1 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        let monday2 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        let tuesday2 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        let wednesday2 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        let thursday2 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        let friday2 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        let saturday2 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        let sunday2 = NSManagedObject(entity: entityDailySchedule!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        monday1.setValue(0, forKey: "day"); monday1.setValue(hour11_00, forKey: "opening"); monday1.setValue(hour20_30, forKey: "closure")
        tuesday1.setValue(0, forKey: "day"); tuesday1.setValue(hour12_00, forKey: "opening"); tuesday1.setValue(hour20_30, forKey: "closure")
        wednesday1.setValue(0, forKey: "day"); wednesday1.setValue(hour12_00, forKey: "opening"); wednesday1.setValue(hour14_00, forKey: "closure")
        thursday1.setValue(0, forKey: "day"); thursday1.setValue(hour12_00, forKey: "opening"); thursday1.setValue(hour20_00, forKey: "closure")
        friday1.setValue(0, forKey: "day"); friday1.setValue(hour11_00, forKey: "opening"); friday1.setValue(hour21_00, forKey: "closure")
        saturday1.setValue(0, forKey: "day"); saturday1.setValue(hour20_00, forKey: "opening"); saturday1.setValue(hour22_00, forKey: "closure")
        sunday1.setValue(0, forKey: "day"); sunday1.setValue(hour20_00, forKey: "opening"); sunday1.setValue(hour23_00, forKey: "closure")
        let week1Table : [NSManagedObject] = [monday1, tuesday1, wednesday1, thursday1, friday1, saturday1, sunday1]
        let week1 = NSSet(array: week1Table)
        
        monday2.setValue(0, forKey: "day"); monday2.setValue(hour11_00, forKey: "opening"); monday2.setValue(hour14_30, forKey: "closure")
        tuesday2.setValue(0, forKey: "day"); tuesday2.setValue(hour20_00, forKey: "opening"); tuesday2.setValue(hour23_00, forKey: "closure")
        wednesday2.setValue(0, forKey: "day"); wednesday2.setValue(hour11_00, forKey: "opening"); wednesday2.setValue(hour14_30, forKey: "closure")
        thursday2.setValue(0, forKey: "day"); thursday2.setValue(hour20_00, forKey: "opening"); thursday2.setValue(hour23_00, forKey: "closure")
        friday2.setValue(0, forKey: "day"); friday2.setValue(hour14_00, forKey: "opening"); friday2.setValue(hour23_00, forKey: "closure")
        saturday2.setValue(0, forKey: "day"); saturday2.setValue(hour20_00, forKey: "opening"); saturday2.setValue(hour23_00, forKey: "closure")
        sunday2.setValue(0, forKey: "day"); sunday2.setValue(hour14_00, forKey: "opening"); sunday2.setValue(hour22_00, forKey: "closure")
        let week2Table : [NSManagedObject] = [monday2, tuesday2, wednesday2, thursday2, friday2, saturday2, sunday2]
        let week2 = NSSet(array: week2Table)
        
        
        //2.8 Create Restaurant
        let entityRestaurant =  NSEntityDescription.entityForName("Restaurant", inManagedObjectContext:self.managedObjectContext)
        
        let luigi = NSManagedObject(entity: entityRestaurant!, insertIntoManagedObjectContext: self.managedObjectContext)
        let brasseurs = NSManagedObject(entity: entityRestaurant!, insertIntoManagedObjectContext: self.managedObjectContext)
        let restoU = NSManagedObject(entity: entityRestaurant!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        luigi.setValue("Chez Luigi", forKey: "name")
        luigi.setValue("Pizzeria chez Luigi, idéale pour manger un bon couscous ou pour dormir.", forKey: "descriptionRestaurant")
        luigi.setValue(5, forKey: "rate")
        luigi.setValue(placeRestauLuigi, forKey: "location")
        luigi.setValue(week1, forKey: "open")
        
        brasseurs.setValue("Les 3 brasseurs", forKey: "name")
        brasseurs.setValue("Bonne brasserie, idéeale pour déguster de bonne flamenkuche autour de bière réalisée sur place.", forKey: "descriptionRestaurant")
        brasseurs.setValue(3, forKey: "rate")
        brasseurs.setValue(week1, forKey: "open")
        brasseurs.setValue(placeRestau3Brasseurs, forKey: "location")
        
        restoU.setValue("RU triolet", forKey: "name")
        restoU.setValue("A proximité de la faculté des sciences, vous pourrez bénéficier de prix exceptionnel sur présentation d'un justificatif de votre participation au FISU.", forKey: "descriptionRestaurant")
        restoU.setValue(4, forKey: "rate")
        restoU.setValue(week2, forKey: "open")
        restoU.setValue(placeRestoU, forKey: "location")
     
        
        
        ///////////
        //3 Save //
        ///////////
        do {
            try self.managedObjectContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
    private func stringToDate (date : String) -> NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        // convert string into date
        return dateFormatter.dateFromString(date) as NSDate!
    }
    
}

