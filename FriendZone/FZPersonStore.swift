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
    var personArray = Array<FZPerson>()
    
    class var sharedInstance: FZPersonStore {
        return _FZPersonStoreSharedInstance
    }
    
    init() {
        personArray.append(FZPerson(name: "Jeff", twitterHandle: "jeffinitelyjeff", timeZoneName: "America/Los_Angeles"))
        personArray.append(FZPerson(name: "Andrew", twitterHandle: "andrewjclark", timeZoneName: "Australia/Adelaide"))
    }
    
    func count() -> Int {
        return personArray.count
    }
    
    func itemAtIndex(idx: Int) -> FZPerson {
        return personArray[idx]
    }
}