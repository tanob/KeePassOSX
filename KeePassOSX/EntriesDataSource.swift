//
//  EntriesDataSource.swift
//  KeePassOSX
//
//  Created by Adriano Bonat on 3/Feb/15.
//  Copyright (c) 2015 Adriano Bonat. All rights reserved.
//

import Foundation
import Cocoa

class EntriesDataSource: NSObject, NSTableViewDataSource {
    var entries: [KPKEntry] = []

    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return entries.count
    }

    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        if tableColumn?.identifier == "username" {
            return entries[row].username
        }
        else if tableColumn?.identifier == "title" {
            return entries[row].title
        }
        else if tableColumn?.identifier == "url" {
            return entries[row].url
        }
        return ""
    }
}
