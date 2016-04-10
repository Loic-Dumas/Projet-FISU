//
//  RestaurantSet.swift
//  FISU_application
//
//  Created by LoïcDumas on 09/04/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation


class WeekSchedule {
    var weekSchedule = [DailySchedule]()
    
    func getAtIndex(index : Int) -> DailySchedule? {
        guard index >= 0 && index < self.weekSchedule.count else {
            return nil
        }
        return self.weekSchedule[index]
    }
    
    func add(speaker : DailySchedule) -> Int {
        guard !self.weekSchedule.contains(speaker) else {
            return self.weekSchedule.indexOf(speaker)!
        }
        self.weekSchedule.append(speaker)
        return self.weekSchedule.indexOf(speaker)!
    }
}
