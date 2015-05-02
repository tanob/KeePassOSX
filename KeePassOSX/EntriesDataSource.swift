import Foundation
import Cocoa
import KeePassKit

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
