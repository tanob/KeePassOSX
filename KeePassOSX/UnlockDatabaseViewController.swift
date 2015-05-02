import Foundation
import Cocoa
import KeePassKit

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
