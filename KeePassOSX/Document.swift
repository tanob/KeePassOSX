//
//  Document.swift
//  KeePassOSX
//
//  Created by Adriano Bonat on 31/Jan/15.
//  Copyright (c) 2015 Adriano Bonat. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    override class func autosavesInPlace() -> Bool {
        return false
    }

    override func makeWindowControllers() {
        super.makeWindowControllers()

        let storyboard = NSStoryboard(name: "Main", bundle: nil)!
        let windowController = storyboard.instantiateControllerWithIdentifier("Document Window Controller") as! DocumentWindowController

        addWindowController(windowController)
    }

    override func dataOfType(typeName: String, error outError: NSErrorPointer) -> NSData? {
        outError.memory = NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        return nil
    }

    override func readFromURL(url: NSURL, ofType typeName: String, error outError: NSErrorPointer) -> Bool {
        return true
    }
}
