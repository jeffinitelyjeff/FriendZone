//
//  FZPerson.swift
//  FriendZone
//
//  Created by jruberg on 4/16/15.
//  Copyright (c) 2015 jruberg. All rights reserved.
//

import Foundation

class FZPerson {
    var name: String
    var twitterHandle: String?
    var timeZone: NSTimeZone?
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, twitterHandle: String, timeZone: NSTimeZone) {
        self.name = name
        self.twitterHandle = twitterHandle
        self.timeZone = timeZone
    }
    
    convenience init(name: String, twitterHandle: String, timeZoneName: String) {
        let timeZone = NSTimeZone(name: timeZoneName)!
        self.init(name: name, twitterHandle: twitterHandle, timeZone: timeZone)
    }
}