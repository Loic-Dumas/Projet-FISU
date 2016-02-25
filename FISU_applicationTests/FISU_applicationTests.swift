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
        let conf = Activity(name: "Conf intro", place: Place.polytech, begin: "02-22-2016 08:30", end: "02-23-2016 11:30")
        let miam = Activity(name: "Repas", place: Place.com, begin: "02-23-2016 12:30", end: "02-23-2016 14:00")
        let rando = Activity(name: "Rando", place: Place.com, begin: "02-23-2016 10:30", end: "02-23-2016 11:00")
        
        XCTAssertEqual(programme.numberOfDays(), 0, "Error")
        
        var truc = programme.addActivity(ski)
        XCTAssertEqual(programme.numberOfDays(), 1, "Error")
        
    }
    
    func testDayWithActivity() {
        let dayWithActivities = DayWithActivities()
        
        let ski = Activity(name: "Ski", place: Place.montagne, begin: "02-23-2016 08:30", end: "02-23-2016 09:30")
        let conf = Activity(name: "Conf intro", place: Place.polytech, begin: "02-22-2016 08:30", end: "02-23-2016 11:30")
        let miam = Activity(name: "Repas", place: Place.com, begin: "02-23-2016 12:30", end: "02-23-2016 14:00")
        let rando = Activity(name: "Rando", place: Place.com, begin: "02-23-2016 10:30", end: "02-23-2016 11:00")
        
        XCTAssertEqual(dayWithActivities.numberOfDays(), 0, "Error")
        
        var truc = dayWithActivities.addActivity(ski)
        XCTAssertEqual(dayWithActivities.numberOfDays(), 1, "Error")
        
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
