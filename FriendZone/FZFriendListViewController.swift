//
//  ViewController.swift
//  FriendZone
//
//  Created by jruberg on 4/16/15.
//  Copyright (c) 2015 jruberg. All rights reserved.
//

import UIKit

class FZFriendListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userTimeLabel: UILabel!
    
    let personStore = FZPersonStore.sharedInstance
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib = UINib(nibName: "FZFriendListCell", bundle:nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: "friendCell")
        
        let userDateComponents = currentTimeOffset(0)
        let hourString = String(format: "%02d", userDateComponents.hour)
        let secondString = String(format: "%02d", userDateComponents.second)
        userTimeLabel.text = "\(hourString):\(secondString)"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return personStore.count()
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! FZFriendListCell
        switch (indexPath.section, indexPath.row) {
        case (0, let row):
            cell.person = personStore.itemAtIndex(row)
            cell.populate()
            return cell
        default:
            println("ERROR: created a cell for an unknown section")
            cell.textLabel!.text = "???"
            return cell
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (0, let row):
            return CGFloat(100.0)
        default:
            println("ERROR: determining height for cell in unknown section")
            return CGFloat(0.0)
        }
    }
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
}

