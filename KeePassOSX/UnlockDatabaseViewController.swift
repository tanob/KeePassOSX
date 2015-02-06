//
//  UnlockDatabaseViewController.swift
//  KeePassOSX
//
//  Created by Adriano Bonat on 1/Feb/15.
//  Copyright (c) 2015 Adriano Bonat. All rights reserved.
//

import Foundation

class UnlockDatabaseViewController: NSViewController {

    var whenDatabaseUnlocked: (KPKTree -> Void)?
    var documentURL: NSURL?

    @IBOutlet weak var errorMessage: NSTextField!
    @IBOutlet weak var passwordField: NSSecureTextField!

    @IBAction func unlockIt(sender: AnyObject) {
        var error: NSError?
        let compositeKey = KPKCompositeKey(password: passwordField.stringValue, key: nil)
        let keePassTree = KPKTree(contentsOfUrl: documentURL!, password: compositeKey, error: &error)

        if (error != nil) {
            errorMessage.stringValue = error!.localizedDescription
            passwordField.stringValue = ""
            NSBeep()
        }
        else {
            whenDatabaseUnlocked!(keePassTree)

            dismissController(self)
        }
    }
}
