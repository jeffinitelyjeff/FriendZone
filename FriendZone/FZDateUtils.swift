//
//  FZDateUtils.swift
//  FriendZone
//
//  Created by jruberg on 4/16/15.
//  Copyright (c) 2015 jruberg. All rights reserved.
//

import Foundation

let knownTimeZones = NSTimeZone.knownTimeZoneNames() as! Array<String>
let calendarUnitFlags = NSCalendarUnit.CalendarUnitWeekday |
                        NSCalendarUnit.CalendarUnitHour    |
                        NSCalendarUnit.CalendarUnitMinute  |
                        NSCalendarUnit.CalendarUnitSecond

enum FZWeekday: Int {
    case Sunday = 1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
}

struct FZDateComponents {
    let weekday: FZWeekday
    let hour: Int
    let minute: Int
    let second: Int
    
    init(components: NSDateComponents) {
        self.weekday = FZWeekday(rawValue: components.weekday)!
        self.hour = components.hour
        self.minute = components.minute
        self.second = components.second
    }
}

func timeZone(fromLocation loc: String) -> NSTimeZone? {
    if contains(knownTimeZones, loc) {
        return NSTimeZone(name: loc)!
    } else {
        // FIXME: this should never return nil
        // FIXME: return type for this function shouldn't be optional
        return nil
    }
}

func currentTimeInTimeZone(tz: NSTimeZone) -> FZDateComponents {
    let now = NSDate()
    var calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
    calendar.timeZone = tz
    let components = calendar.components(calendarUnitFlags, fromDate: now)
    return FZDateComponents(components: components)
}

func currentTimeOffset(hoursOffset: Double) -> FZDateComponents {
    let secondsOffset: NSTimeInterval = hoursOffset * 60 * 60
    let date = NSDate(timeIntervalSinceNow: secondsOffset)
    var calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
    let components = calendar.components(calendarUnitFlags, fromDate: date)
    return FZDateComponents(components: components)
}

