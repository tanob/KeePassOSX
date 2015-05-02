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
