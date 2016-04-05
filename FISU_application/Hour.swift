//
//  Hour.swift
//  FISU_application
//
//  Created by LoïcDumas on 24/03/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation
import CoreData


class Hour: NSManagedObject {
    
    
    func toString() -> String {
        var result = ""
        if self.hour!.intValue < 10 {
            result += "0"
        }
        result += String(self.hour)
        result += ":"
        if self.minute!.intValue < 10 {
            result += "0"
        }
        result += String(self.minute)
        
        return result
        
    }
    

}
