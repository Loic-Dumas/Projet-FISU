//
//  SpeakerSet.swift
//  FISU_application
//
//  Created by LoïcDumas on 08/03/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import Foundation

class SpeakerSet {
    
    private var speakerSet = [Speaker]()
    
    func addSpeaker(speaker : Speaker) -> Int? {
        guard self.contains(speaker) else {
            return nil
        }
        speakerSet.append(speaker)
        return self.getIndexSpeaker(speaker)
    }
    
    func contains(speaker : Speaker) -> Bool {
        return self.speakerSet.contains(speaker)
    }
    
    func count() -> Int {
        return self.speakerSet.count
    }
    
    func getIndexSpeaker(speaker :Speaker) -> Int? {
        return speakerSet.indexOf(speaker)
    }
    
    func getSpeakerAtIndex(index : Int) -> Speaker? {
        guard index >= 0 && index < self.count() else {
            return nil
        }
        return self.speakerSet[index]
    }
    
    func removeSpeakerAtIndex(index : Int) -> Speaker? {
        return self.speakerSet.removeAtIndex(index)
    }
    
}