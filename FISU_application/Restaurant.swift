//
//  Restaurant.swift
//  FISU_application
//
//  Created by LoïcDumas on 24/03/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation
import CoreData


class Restaurant: NSManagedObject {
    
    private var weekSchedulePrivate : WeekSchedule?
    
    var weekSchedule : WeekSchedule {
        get {
            if weekSchedulePrivate == nil {
                weekSchedulePrivate = WeekSchedule()
                for dailySchedule in open! {
                    print("Restaurant : Ouvert le \(dailySchedule.day) à :")
                    weekSchedulePrivate!.add(dailySchedule as! DailySchedule)
                }
            }
            return self.weekSchedulePrivate!
        }
    }

}
