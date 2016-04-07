//
//  SpeakerSet.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 05/04/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

class SpeakerSet {
    var speakers = [Speaker]()
    
    func getAtIndex(index : Int) -> Speaker? {
        guard index >= 0 && index < self.speakers.count else {
            return nil
        }
        return self.speakers[index]
    }
    
    func add(speaker : Speaker) -> Int {
        guard !self.speakers.contains(speaker) else {
            return self.speakers.indexOf(speaker)!
        }
        self.speakers.append(speaker)
        return self.speakers.indexOf(speaker)!
    }
}
