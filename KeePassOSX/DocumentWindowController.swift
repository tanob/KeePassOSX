//
//  DocumentWindowController.swift
//  KeePassOSX
//
//  Created by Adriano Bonat on 1/Feb/15.
//  Copyright (c) 2015 Adriano Bonat. All rights reserved.
//

import Foundation
import Cocoa
import KeePassKit

class DocumentWindowController: NSWindowController {

    override var document: AnyObject? {
        didSet {
            let unlockDatabase: UnlockDatabaseViewController = storyboard?.instantiateControllerWithIdentifier("Unlock Database") as! UnlockDatabaseViewController

            unlockDatabase.documentURL = document?.fileURL

            unlockDatabase.whenDatabaseUnlocked = { keePassTree in
                let showDatabase = self.storyboard?.instantiateControllerWithIdentifier("Show Database") as! NSViewController

                showDatabase.representedObject = keePassTree

                let groupsViewController = showDatabase.childViewControllers[0] as! GroupsViewController
                let entriesViewController = showDatabase.childViewControllers[1] as! EntriesViewController

                groupsViewController.whenGroupSelected = { group in
                    entriesViewController.entries = group.entries! as! [KPKEntry]
                }

                self.contentViewController = showDatabase
            }

            contentViewController = unlockDatabase
        }
    }
}
