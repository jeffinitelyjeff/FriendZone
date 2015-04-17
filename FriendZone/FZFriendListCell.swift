//
//  FZFriendListCell.swift
//  FriendZone
//
//  Created by jruberg on 4/16/15.
//  Copyright (c) 2015 jruberg. All rights reserved.
//

import Foundation
import UIKit

class FZFriendListCell: UITableViewCell {

    var person: FZPerson?

    @IBOutlet weak var portraitView: UIImageView!
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var locationView: UILabel!
    @IBOutlet weak var timeView: UILabel!

    func populate() {
        if let p = person {
            nameView.text = p.name
            locationView.text = p.location
            timeView.text = self.formatTime()
            
            if let urlString = p.twitterPortraitURL() {
                let str = urlString.lowercaseString
                if let url = NSURL(string: str) {
                    if let data = NSData(contentsOfURL: url) {
                        portraitView.image = UIImage(data: data)
                    } else {
                        println("ERROR[populate]: no data for URL \(str)")
                        portraitView.image = nil
                    }
                } else {
                    println("ERROR[populate]: can't parse string as URL \(str)")
                    portraitView.image = nil
                }
            } else {
                println("ERROR[populate]: empty twitter url string")
            }
        
        } else {
            println("ERROR[populate]: empty person")
        }
    }
    
    func formatTime() -> String? {
        if let p = person {
            if let components = p.getDateComponents() {
                let hourString = String(format: "%02d", components.hour)
                let secondString = String(format: "%02d", components.second)
                return "\(hourString):\(secondString)"
            } else {
                println("ERROR[formatTime]: no date components -- probably means invalid timezone")
                return nil
            }
        } else {
            println("ERROR[formatTime]: empty person")
            return nil
        }
    }
}