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
    var entityActivity : NSEntityDescription
    
    var managedObjectContext : NSManagedObjectContext
    
    init() {
        self.managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        self.entityActivity = NSEntityDescription.entityForName("Activity", inManagedObjectContext: self.managedObjectContext)!
    }
    
    
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
        
        
        let placeTypeSport = NSManagedObject(entity: entityPlaceType!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeTypeConference = NSManagedObject(entity: entityPlaceType!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeTypeAccomodation = NSManagedObject(entity: entityPlaceType!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeTypeRestaurant = NSManagedObject(entity: entityPlaceType!, insertIntoManagedObjectContext: self.managedObjectContext)
        placeTypeSport.setValue("Sport", forKey: "name")
        placeTypeConference.setValue("Conference place", forKey: "name")
        placeTypeAccomodation.setValue("Accomodation", forKey: "name")
        placeTypeRestaurant.setValue("Restaurant", forKey: "name")
        
        
        //2.2 create Place
        let entityPlace =  NSEntityDescription.entityForName("Place", inManagedObjectContext:self.managedObjectContext)
        
        let placePolytech = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeCom = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placePeyrou = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeEdithPiaf = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeMontcalm = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeLez = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeRestauLuigi = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeRestau3Brasseurs = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeRestoU = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        let placeMarvellous = NSManagedObject(entity: entityPlace!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        placePolytech.setValue("Polytech", forKey: "title")
        placePolytech.setValue("Engineering School", forKey: "subTitle")
        placePolytech.setValue(43.632726, forKey: "latitude")
        placePolytech.setValue(3.862590, forKey: "longitude")
        placePolytech.setValue(placeTypeConference, forKey: "type")
        
        placeCom.setValue("Comédie", forKey: "title")
        placeCom.setValue("Famous place in Montpellier", forKey: "subTitle")
        placeCom.setValue(43.608917, forKey: "latitude")
        placeCom.setValue(3.880237, forKey: "longitude")
        placeCom.setValue(placeTypeAccomodation, forKey: "type")
        
        placePeyrou.setValue("Place du Peyrou", forKey: "title")
        placePeyrou.setValue("Nice garden", forKey: "subTitle")
        placePeyrou.setValue(43.611304, forKey: "latitude")
        placePeyrou.setValue(3.870713, forKey: "longitude")
        placePeyrou.setValue(placeTypeSport, forKey: "type")
        
        placeEdithPiaf.setValue("Parc Edith Piaf", forKey: "title")
        placeEdithPiaf.setValue("Nice Park", forKey: "subTitle")
        placeEdithPiaf.setValue(43.621857, forKey: "latitude")
        placeEdithPiaf.setValue(3.888266, forKey: "longitude")
        placeEdithPiaf.setValue(placeTypeSport, forKey: "type")
        
        placeMontcalm.setValue("Parc Montcalm", forKey: "title")
        placeMontcalm.setValue("Nice Park", forKey: "subTitle")
        placeMontcalm.setValue(43.598023, forKey: "latitude")
        placeMontcalm.setValue(3.860017, forKey: "longitude")
        placeMontcalm.setValue(placeTypeSport, forKey: "type")
        
        placeLez.setValue("Rives du Lez", forKey: "title")
        placeLez.setValue("Le lez, tumultueux et impétueux fleuves. Attention, contient des déchets toxiques, ne pas se baingner", forKey: "subTitle")
        placeLez.setValue(43.607505, forKey: "latitude")
        placeLez.setValue(3.897319, forKey: "longitude")
        placeLez.setValue(placeTypeSport, forKey: "type")
        
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
        
        placeMarvellous.setValue("Marvellous", forKey: "title")
        placeMarvellous.setValue("Burger restaurant", forKey: "subTitle")
        placeMarvellous.setValue(43.609358, forKey: "latitude")
        placeMarvellous.setValue( 3.877035, forKey: "longitude")
        placeMarvellous.setValue(placeTypeRestaurant, forKey: "type")
        
        
        //2.3 create ActivityCategory
        let entityActivityCategory =  NSEntityDescription.entityForName("ActivityCategory", inManagedObjectContext:self.managedObjectContext)
        
        let activityCategorySport = NSManagedObject(entity: entityActivityCategory!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activityCategoryConference = NSManagedObject(entity: entityActivityCategory!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activityCategoryMiscellaneous = NSManagedObject(entity: entityActivityCategory!, insertIntoManagedObjectContext: self.managedObjectContext)
        activityCategorySport.setValue("Sport", forKey: "name")
        activityCategoryConference.setValue("Conference", forKey: "name")
        activityCategoryMiscellaneous.setValue("Miscellaneous", forKey: "name")
        
        
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
        
        let activityWelcoming = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activityVolley = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activityRugby = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activityfreeTime = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activityRunning = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activityClosingCeremony = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activityGariga = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        let activityKayak = NSManagedObject(entity: entityActivity!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        
        activityWelcoming.setValue("Welcoming", forKey: "name")
        activityWelcoming.setValue("This description is fort the welcoming, LoremExsistit autem hoc loco quaedam quaestio subdifficilis, num quando amici novi, digni amicitia", forKey: "descriptionActivity")
        activityWelcoming.setValue(stringToDate("06-11-2016 09:30"), forKey: "beginning")
        activityWelcoming.setValue(stringToDate("06-11-2016 10:45"), forKey: "ending")
        activityWelcoming.setValue(placePolytech, forKey: "location")
        activityWelcoming.setValue(activityCategoryConference, forKey: "category")
        activityWelcoming.setValue(speakers, forKey: "speakers")
        activityWelcoming.setValue(true, forKey: "going")
        
        activityVolley.setValue("Volley", forKey: "name")
        activityVolley.setValue("A match of volley ball LoremExsistit autem hoc loco quaedam quaestio subdifficilis, num quando amici novi, digni LoremExsistit autem hoc loco quaedam quaestio subdifficilis, num quando amici novi, digni ", forKey: "descriptionActivity")
        activityVolley.setValue(stringToDate("06-11-2016 11:00"), forKey: "beginning")
        activityVolley.setValue(stringToDate("06-11-2016 12:30"), forKey: "ending")
        activityVolley.setValue(placeMontcalm, forKey: "location")
        activityVolley.setValue(activityCategorySport, forKey: "category")
        
        activityRugby.setValue("Rugby", forKey: "name")
        activityRugby.setValue("Match of rugby. LoremExsistit autem hoc loco quaedam quaestio subdifficilis, num quando amici novi, digni ", forKey: "descriptionActivity")
        activityRugby.setValue(stringToDate("06-11-2016 15:00"), forKey: "beginning")
        activityRugby.setValue(stringToDate("06-11-2016 16:30"), forKey: "ending")
        activityRugby.setValue(placeMontcalm, forKey: "location")
        activityRugby.setValue(activityCategorySport, forKey: "category")
        
        activityfreeTime.setValue("Free time", forKey: "name")
        activityfreeTime.setValue("Discover a famus place in Montpellier.", forKey: "descriptionActivity")
        activityfreeTime.setValue(stringToDate("06-12-2016 09:30"), forKey: "beginning")
        activityfreeTime.setValue(stringToDate("06-12-2016 10:30"), forKey: "ending")
        activityfreeTime.setValue(placeCom, forKey: "location")
        activityfreeTime.setValue(activityCategoryMiscellaneous, forKey: "category")
        activityfreeTime.setValue(true, forKey: "going")
        
        activityGariga.setValue("Danse Gariga", forKey: "name")
        activityGariga.setValue("Discover a wonderfull danse session of the folkloric club of Montpllier", forKey: "descriptionActivity")
        activityGariga.setValue(stringToDate("06-12-2016 10:45"), forKey: "beginning")
        activityGariga.setValue(stringToDate("06-12-2016 12:00"), forKey: "ending")
        activityGariga.setValue(placeCom, forKey: "location")
        activityGariga.setValue(activityCategoryMiscellaneous, forKey: "category")
        
        activityRunning.setValue("Running", forKey: "name")
        activityRunning.setValue("A short run to start the FISU.", forKey: "descriptionActivity")
        activityRunning.setValue(stringToDate("06-12-2016 15:30"), forKey: "beginning")
        activityRunning.setValue(stringToDate("06-12-2016 15:30"), forKey: "ending")
        activityRunning.setValue(placePeyrou, forKey: "location")
        activityRunning.setValue(activityCategorySport, forKey: "category")
        
        activityClosingCeremony.setValue("Closing Ceremony", forKey: "name")
        activityClosingCeremony.setValue("This was a really great FISU for 2016, now it's time for a wonderfull closing ceremony", forKey: "descriptionActivity")
        activityClosingCeremony.setValue(stringToDate("06-13-2016 19:15"), forKey: "beginning")
        activityClosingCeremony.setValue(stringToDate("06-13-2016 15:30"), forKey: "ending")
        activityClosingCeremony.setValue(placePolytech, forKey: "location")
        activityClosingCeremony.setValue(activityCategoryConference, forKey: "category")
        activityClosingCeremony.setValue(speakers, forKey: "speakers")
        
        activityKayak.setValue("Kayak", forKey: "name")
        activityKayak.setValue("Race in Kayak. Prepare your short and sunglasses, because it's raining.", forKey: "descriptionActivity")
        activityKayak.setValue(stringToDate("06-12-2016 14:00"), forKey: "beginning")
        activityKayak.setValue(stringToDate("06-12-2016 16:30"), forKey: "ending")
        activityKayak.setValue(placeLez, forKey: "location")
        activityKayak.setValue(activityCategorySport, forKey: "category")
        
        
        //2.6 Create Restaurant
        let entityRestaurant =  NSEntityDescription.entityForName("Restaurant", inManagedObjectContext:self.managedObjectContext)
        
        let luigi = NSManagedObject(entity: entityRestaurant!, insertIntoManagedObjectContext: self.managedObjectContext)
        let brasseurs = NSManagedObject(entity: entityRestaurant!, insertIntoManagedObjectContext: self.managedObjectContext)
        let restoU = NSManagedObject(entity: entityRestaurant!, insertIntoManagedObjectContext: self.managedObjectContext)
        let restoMarvellous = NSManagedObject(entity: entityRestaurant!, insertIntoManagedObjectContext: self.managedObjectContext)
        
        luigi.setValue("Chez Luigi", forKey: "name")
        luigi.setValue("Pizzeria chez Luigi, idéale pour manger un bon couscous ou pour dormir.", forKey: "descriptionRestaurant")
        luigi.setValue(5, forKey: "rate")
        luigi.setValue(placeRestauLuigi, forKey: "location")
        luigi.setValue(19, forKey: "openning")
        luigi.setValue(23, forKey: "closing")
        
        brasseurs.setValue("Les 3 brasseurs", forKey: "name")
        brasseurs.setValue("Bonne brasserie, idéeale pour déguster de bonne flamenkuche autour de bière réalisée sur place.", forKey: "descriptionRestaurant")
        brasseurs.setValue(3, forKey: "rate")
        brasseurs.setValue(placeRestau3Brasseurs, forKey: "location")
        brasseurs.setValue(14, forKey: "openning")
        brasseurs.setValue(23, forKey: "closing")
        
        restoU.setValue("RU triolet", forKey: "name")
        restoU.setValue("A proximité de la faculté des sciences, vous pourrez bénéficier de prix exceptionnel sur présentation d'un justificatif de votre participation au FISU.", forKey: "descriptionRestaurant")
        restoU.setValue(2, forKey: "rate")
        restoU.setValue(placeRestoU, forKey: "location")
        restoU.setValue(11, forKey: "openning")
        restoU.setValue(14, forKey: "closing")
        
        restoMarvellous.setValue("Marvellous", forKey: "name")
        restoMarvellous.setValue("Restaurant spécialisé dans les comics. De nombreux plats à déguster pour un prix modeste. Le soir, fait également bar gay, d'après google. Et nous recommandons le burger avec le magré de canard ! ", forKey: "descriptionRestaurant")
        restoMarvellous.setValue(5, forKey: "rate")
        restoMarvellous.setValue(placeMarvellous, forKey: "location")
        restoMarvellous.setValue(11, forKey: "openning")
        restoMarvellous.setValue(23, forKey: "closing")
     
        
        
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

