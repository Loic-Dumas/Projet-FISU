//
//  FISU_applicationTests.swift
//  FISU_applicationTests
//
//  Created by Arnaud ZARAGOZA on 22/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import XCTest
@testable import FISU_application

class FISU_applicationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testProgramme() {
        let programme = Programme()
        let ski = Activity(name: "Ski", place: Place.montagne, begin: "02-23-2016 08:30", end: "02-23-2016 09:30")
        let miam = Activity(name: "Repas", place: Place.com, begin: "02-23-2016 12:30", end: "02-23-2016 14:00")
        let rando = Activity(name: "Rando", place: Place.com, begin: "02-23-2016 10:30", end: "02-23-2016 11:00")
        
        
        XCTAssertEqual(programme.numberOfDays(), 0)
        
        // add one
        programme.addActivity(ski)
        XCTAssertEqual(programme.numberOfDays(), 1)
        XCTAssertEqual(programme.numberOfActivityForDay(ski.begin), 1)
        XCTAssertEqual(programme.numberOfActivityForDay(0), 1)
        XCTAssertNil(programme.numberOfActivityForDay(1))
        XCTAssertEqual(programme.getAtIndex(0, activityIndex: 0), ski)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 0), ski)
        
        // add the same
        programme.addActivity(ski)
        XCTAssertEqual(programme.numberOfDays(), 1)
        XCTAssertEqual(programme.numberOfActivityForDay(ski.begin), 1)
        XCTAssertEqual(programme.numberOfActivityForDay(0), 1)
        XCTAssertNil(programme.numberOfActivityForDay(1))
        XCTAssertEqual(programme.getAtIndex(0, activityIndex: 0), ski)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 0), ski)
        
        // add new activity same day
        programme.addActivity(miam)
        XCTAssertEqual(programme.numberOfDays(), 1)
        XCTAssertEqual(programme.numberOfActivityForDay(ski.begin), 2)
        XCTAssertEqual(programme.numberOfActivityForDay(0), 2)
        XCTAssertNil(programme.numberOfActivityForDay(1))
        XCTAssertEqual(programme.getAtIndex(0, activityIndex: 0), ski)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 0), ski)
        XCTAssertEqual(programme.getAtIndex(0, activityIndex: 1), miam)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 1), miam)
        
        // add same day, disorder hour
        programme.addActivity(rando)
        XCTAssertEqual(programme.numberOfDays(), 1)
        XCTAssertEqual(programme.numberOfActivityForDay(ski.begin), 3)
        XCTAssertEqual(programme.numberOfActivityForDay(0), 3)
        XCTAssertNil(programme.numberOfActivityForDay(1))
        XCTAssertEqual(programme.getAtIndex(0, activityIndex: 0), ski)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 0), ski)
        XCTAssertEqual(programme.getAtIndex(0, activityIndex: 1), rando)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 1), rando)
        XCTAssertEqual(programme.getAtIndex(0, activityIndex: 2), miam)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 2), miam)
        
        // a new day
        let randoDeFin = Activity(name: "Rando d'adieux", place: Place.com, begin: "02-24-2016 10:30", end: "02-24-2016 11:00")
        programme.addActivity(randoDeFin)
        XCTAssertEqual(programme.numberOfDays(), 2)
        XCTAssertEqual(programme.numberOfActivityForDay(randoDeFin.begin), 1)
        XCTAssertEqual(programme.numberOfActivityForDay(1), 1)
        XCTAssertNil(programme.numberOfActivityForDay(2))
        XCTAssertEqual(programme.getAtIndex(1, activityIndex: 0), randoDeFin)
        XCTAssertEqual(programme.getAtDate(randoDeFin.begin, index: 0), randoDeFin)
        
        XCTAssertEqual(programme.numberOfActivityForDay(rando.begin), 3)
        XCTAssertEqual(programme.numberOfActivityForDay(0), 3)
        XCTAssertEqual(programme.getAtIndex(0, activityIndex: 0), ski)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 0), ski)
        XCTAssertEqual(programme.getAtIndex(0, activityIndex: 1), rando)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 1), rando)
        XCTAssertEqual(programme.getAtIndex(0, activityIndex: 2), miam)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 2), miam)
        
        // add activity before all
        let randoDeDebut = Activity(name: "Rando de début", place: Place.com, begin: "02-22-2016 10:30", end: "02-22-2016 11:00")
        programme.addActivity(randoDeDebut)
        XCTAssertEqual(programme.numberOfDays(), 3)
        XCTAssertEqual(programme.numberOfActivityForDay(randoDeDebut.begin), 1)
        XCTAssertEqual(programme.numberOfActivityForDay(0), 1)
        XCTAssertNil(programme.numberOfActivityForDay(3))
        XCTAssertEqual(programme.getAtIndex(0, activityIndex: 0), randoDeDebut)
        XCTAssertEqual(programme.getAtDate(randoDeDebut.begin, index: 0), randoDeDebut)
        
        XCTAssertEqual(programme.numberOfActivityForDay(rando.begin), 3)
        XCTAssertEqual(programme.numberOfActivityForDay(1), 3)
        XCTAssertEqual(programme.getAtIndex(1, activityIndex: 0), ski)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 0), ski)
        XCTAssertEqual(programme.getAtIndex(1, activityIndex: 1), rando)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 1), rando)
        XCTAssertEqual(programme.getAtIndex(1, activityIndex: 2), miam)
        XCTAssertEqual(programme.getAtDate(ski.begin, index: 2), miam)
        
        XCTAssertEqual(programme.numberOfActivityForDay(randoDeFin.begin), 1)
        XCTAssertEqual(programme.numberOfActivityForDay(2), 1)
        XCTAssertEqual(programme.getAtIndex(2, activityIndex: 0), randoDeFin)
        XCTAssertEqual(programme.getAtDate(randoDeFin.begin, index: 0), randoDeFin)

        
        
        
    }
    
    func testDayWithActivity() {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        // convert string into date
        let date = dateFormatter.dateFromString("02-23-2016 00:00") as NSDate!
        
        let dayWithActivities = DayWithActivities(day: date)
        
        let ski = Activity(name: "Ski", place: Place.montagne, begin: "02-23-2016 08:30", end: "02-23-2016 09:30")
        //let conf = Activity(name: "Conf intro", place: Place.polytech, begin: "02-22-2016 08:30", end: "02-23-2016 11:30")
        let miam = Activity(name: "Repas", place: Place.com, begin: "02-23-2016 12:30", end: "02-23-2016 14:00")
        let rando = Activity(name: "Rando", place: Place.com, begin: "02-23-2016 10:30", end: "02-23-2016 11:00")
        
        XCTAssertEqual(dayWithActivities.numberOfActivity(), 0)
        
        // Simple add
        XCTAssertEqual(dayWithActivities.addActivity(ski), 0)
        XCTAssertEqual(dayWithActivities.getActivityAtIndex(0), ski)
        XCTAssertEqual(dayWithActivities.numberOfActivity(), 1)
        XCTAssertEqual(dayWithActivities.contains(ski), true)
        
        // Add an already existing activity
        XCTAssertEqual(dayWithActivities.addActivity(ski), nil)
        XCTAssertEqual(dayWithActivities.numberOfActivity(), 1)
        XCTAssertEqual(dayWithActivities.getActivityAtIndex(0), ski)
        
        // Add a second activity
        XCTAssertEqual(dayWithActivities.addActivity(miam), 1)
        XCTAssertEqual(dayWithActivities.numberOfActivity(), 2)
        XCTAssertEqual(dayWithActivities.getActivityAtIndex(0), ski)
        XCTAssertEqual(dayWithActivities.getActivityAtIndex(1), miam)
        
        // Add a thrid activity and reorder the activities
        XCTAssertEqual(dayWithActivities.addActivity(rando), 1)
        XCTAssertEqual(dayWithActivities.numberOfActivity(), 3)
        XCTAssertEqual(dayWithActivities.getActivityAtIndex(0), ski)
        XCTAssertEqual(dayWithActivities.getActivityAtIndex(1), rando)
        XCTAssertEqual(dayWithActivities.getActivityAtIndex(2), miam)
    }
    
    func testExample() {
        let ac = Activity.ski
        print(ac.begin)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
