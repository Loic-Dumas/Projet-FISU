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
    /*
    var speakers: [Speaker]?
    var events: [Event]?
    
    func demoData() {
        let firstStart: Bool? = NSUserDefaults.standardUserDefaults().objectForKey("firstStart") as? Bool
        
        guard let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate else{
            return
        }
        let context = appDelegate.managedObjectContext
        
        if firstStart == nil || firstStart == true {
            let speakerEntity: NSEntityDescription? = NSEntityDescription.entityForName("Speaker", inManagedObjectContext: context)
            let eventEntity: NSEntityDescription? = NSEntityDescription.entityForName("Event", inManagedObjectContext: context)
            if eventEntity != nil && speakerEntity != nil {
              /*  let event1: Activity = Activity(entity : eventEntity!, insertIntoManagedObjectContext: context)
                let event2: Activity = Activity(entity : eventEntity!, insertIntoManagedObjectContext: context)
                let event3: Activity = Activity(entity : eventEntity!, insertIntoManagedObjectContext: context)
                event1.name = "Envenement 1"
                event1.date = NSDate()
                event1.latitude = 39
                event1.longitude = 40
                event2.name = "Envenement 2"
                event2.date = NSDate()
                event2.latitude = 35
                event2.longitude = 42
                event3.name = "Envenement 3"
                event3.date = NSDate()
                event3.latitude = -20
                event3.longitude = -60
                let speaker1: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                let speaker2: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                let speaker3: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                let speaker4: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                let speaker5: Speaker = Speaker(entity : speakerEntity!, insertIntoManagedObjectContext: context)
                speaker1.name = "Parleur 1"
                speaker1.age = 42
                speaker2.name = "Parleur 2"
                speaker2.age = 56
                speaker3.name = "Parleur 3"
                speaker3.age = 69
                speaker4.name = "Parleur 4"
                speaker4.age = 36
                speaker5.name = "Parleur 5"
                speaker5.age = 29
                var currentSet1: Set<Speaker> = Set<Speaker>()
                var currentSet2: Set<Speaker> = Set<Speaker>()
                var currentSet3: Set<Speaker> = Set<Speaker>()
                currentSet1.insert(speaker1)
                currentSet1.insert(speaker3)
                currentSet1.insert(speaker5)
                currentSet2.insert(speaker5)
                currentSet2.insert(speaker2)
                currentSet2.insert(speaker4)
                currentSet3.insert(speaker1)
                currentSet3.insert(speaker4)
                currentSet3.insert(speaker3)
                currentSet3.insert(speaker5)
                event1.speaker = NSSet(set: currentSet1)
                event2.speaker = NSSet(set: currentSet2)
                event3.speaker = NSSet(set: currentSet3)
*/
                
            }
            
            if appDelegate.managedObjectContext.hasChanges {
                appDelegate.saveContext()
                NSUserDefaults.standardUserDefaults().setObject(false, forKey: "firstStart")
            }
        }
    }
    
    func loadData() {
        guard let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate else{
            return
        }
        
        let fetchRequestEvent = NSFetchRequest(entityName: "Event")
        let fetchRequestSpeaker = NSFetchRequest(entityName: "Speaker")
        
        do {
            if let results = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequestEvent) as? [Event]
            {
                self.events = results
            }
        }
        catch {
            fatalError("There was an error fetching the list of Event! \(error)")
        }
        
        do {
            if let results = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequestSpeaker) as? [Speaker]
            {
                self.speakers = results
            }
        }
        catch {
            fatalError("There was an error fetching the list of Event! \(error)")
        }
        
    }
    
    func readData() {
        /*
        guard let parleurs = speakers else {
            self.myTextView.text = "lama de lotre"
            return
        }
        
        self.myTextView.text = "Le récit est ci-dessous :\n"
        
        self.myTextView.text = self.myTextView.text + "Nombre de parleur dans la base : " + String(parleurs.count) + "\n"
        
        for sp in parleurs {
            self.myTextView.text = self.myTextView.text + "Nom :" + sp.name! + "\n"
            if let evv = sp.event {
                for evvv in evv {
                    self.myTextView.text = self.myTextView.text + "even : " + evvv.name! + "\n"
                }
            }
            
        }
        
        guard let evenements = events else {
            self.myTextView.text = "Penis"
            return
        }
        
        self.myTextView.text = self.myTextView.text + "Nombre d'evenements dans la base : " + String(evenements.count) + "\n"
        
        for evt in evenements {
            self.myTextView.text = self.myTextView.text + "Nom :" + evt.name! + "\n"
            if let spk = evt.speaker {
                for set in spk {
                    self.myTextView.text = self.myTextView.text + "spkk : " + set.name! + "\n"
                }
            }
        }*/
    }
*/
}

