//
//  ViewController.swift
//  FriendZone
//
//  Created by jruberg on 4/16/15.
//  Copyright (c) 2015 jruberg. All rights reserved.
//

import UIKit

class FZFriendZoneViewController: UITableViewController {
    
    let personStore = FZPersonStore.sharedInstance
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return personStore.count()
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "FZFriendZoneViewController")
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            cell.textLabel!.text = "Me"
            return cell
        case (1, let row):
            cell.textLabel!.text = personStore.itemAtIndex(row).name
            return cell
        default:
            cell.textLabel!.text = "???"
            return cell
        }
    }

}

