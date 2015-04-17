//
//  FZPerson.swift
//  FriendZone
//
//  Created by jruberg on 4/16/15.
//  Copyright (c) 2015 jruberg. All rights reserved.
//

import Foundation

class FZPerson {
    // FIXME: this is only useful for digimon
    let urlNormalizers: Dictionary<String, String> = [
        "(": "",
        ")": "",
        "[": "",
        "]": "",
        ",": " ",
        " ": "_",
        "-": "_",
        "ō": "o",
    ]
    
    var name: String
    var twitterHandle: String?
    var location: String?
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, twitterHandle: String, location: String) {
        self.name = name
        self.twitterHandle = twitterHandle
        self.location = location
    }
    
    func getTimeZone() -> NSTimeZone? {
        if let location = self.location {
            return timeZone(fromLocation: location)
        } else {
            return nil
        }
    }
    
    func getDateComponents() -> FZDateComponents? {
        if let tz = self.getTimeZone() {
            return currentTimeInTimeZone(tz)
        } else {
            return nil
        }
    }
    
    func twitterPortraitURL() -> String? {
        // FIXME: stop using digimon
        if let name = self.twitterHandle {
            let normalizedString = stringByDictReplacement(name, urlNormalizers)
            return "http://podigious.com/img/\(normalizedString).jpg"
        } else {
            println("ERROR[twitterPortraitURL] no twitter handle")
            return nil
        }
    }
}