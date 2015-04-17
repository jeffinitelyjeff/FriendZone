//
//  FZUtils.swift
//  FriendZone
//
//  Created by jruberg on 4/17/15.
//  Copyright (c) 2015 jruberg. All rights reserved.
//

import Foundation

func randomElement<X>(arr: Array<X>) -> X {
    let idx = arc4random_uniform(UInt32(arr.count))
    return arr[Int(idx)]
}

func stringByDictReplacement(str: String, dict: Dictionary<String, String>) -> String {
    var replacedStr = str
    for (key, val) in dict {
        replacedStr = replacedStr.stringByReplacingOccurrencesOfString(key, withString: val, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    return replacedStr
}