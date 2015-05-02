//
//  EntriesViewController.swift
//  KeePassOSX
//
//  Created by Adriano Bonat on 2/Feb/15.
//  Copyright (c) 2015 Adriano Bonat. All rights reserved.
//

import Foundation
import Cocoa
import KeePassKit

public class EntriesViewController: NSViewController {

    let entriesDataSource = EntriesDataSource()

    @IBOutlet public weak var entriesTableView: NSTableView!

    public var entries: [KPKEntry] = [] {
        didSet {
            entriesDataSource.entries = entries
            entriesTableView.reloadData()
        }
    }

    override public func viewWillAppear() {
        entriesTableView.setDataSource(entriesDataSource)
    }
}
