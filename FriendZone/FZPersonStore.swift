//
//  FZPersonStore.swift
//  FriendZone
//
//  Created by jruberg on 4/16/15.
//  Copyright (c) 2015 jruberg. All rights reserved.
//

import Foundation

private let _FZPersonStoreSharedInstance = FZPersonStore()

class FZPersonStore {
    var personArray: Array<FZPerson> = []
    
    class var sharedInstance: FZPersonStore {
        return _FZPersonStoreSharedInstance
    }
    
    init() {
        let namesPath = NSBundle.mainBundle().pathForResource("sampleNames", ofType: "txt")
        var namesText = String(contentsOfFile: namesPath!, encoding: NSUTF8StringEncoding, error: nil)
        var names = split(namesText!) {$0 == "\n"}
        
        for index in 0...100 {
            let name = randomElement(names)
            let location = randomElement(knownTimeZones)
            personArray.append(FZPerson(name: name, twitterHandle: name, location: location))
        }
    }
    
    func count() -> Int {
        return personArray.count
    }
    
    func itemAtIndex(idx: Int) -> FZPerson {
        return personArray[idx]
    }
}