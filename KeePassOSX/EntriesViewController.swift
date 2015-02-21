//
//  EntriesViewController.swift
//  KeePassOSX
//
//  Created by Adriano Bonat on 2/Feb/15.
//  Copyright (c) 2015 Adriano Bonat. All rights reserved.
//

import Foundation
import Cocoa

public class EntriesViewController: NSViewController {

    let entriesDataSource = EntriesDataSource()

    @IBOutlet weak var entriesTableView: NSTableView!

    var entries: [KPKEntry] = [] {
        didSet {
            entriesDataSource.entries = entries
            entriesTableView.reloadData()
        }
    }

    override public func viewWillAppear() {
        entriesTableView.setDataSource(entriesDataSource)
    }
}
