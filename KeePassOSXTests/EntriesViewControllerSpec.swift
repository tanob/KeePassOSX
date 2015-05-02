import Quick
import Nimble

import KeePassOSX

class EntriesViewControllerSpec: QuickSpec {
    override func spec() {
        let controller = EntriesViewController()
        let tableView  = MockNSTableView()

        beforeEach {
            controller.entriesTableView = tableView
        }

        it("should reload the data") {
            controller.entries = []

            expect(tableView.reloadDataCalled) == true
        }

        it("should bind datasource when view will appear") {
            controller.viewWillAppear()

            expect(tableView.dataSource()) !== nil
        }
    }

    class MockNSTableView: NSTableView {
        var reloadDataCalled = false

        override func reloadData() {
            reloadDataCalled = true
        }
    }
}
