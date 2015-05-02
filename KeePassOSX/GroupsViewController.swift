import Foundation
import Cocoa
import KeePassKit

class GroupsViewController: NSViewController, NSOutlineViewDelegate {
    let emptyGroup = KPKGroup()

    var dataSource: GroupHierarchyDataSource?
    var whenGroupSelected: (KPKGroup -> Void)?

    @IBOutlet weak var groupHierarchyView: NSOutlineView!

    override func viewWillAppear() {
        let keePassTree: KPKTree = parentViewController?.representedObject as! KPKTree
        let root: KPKGroup = keePassTree.root
        let allGroups: [KPKGroup] = keePassTree.allGroups as! [KPKGroup]

        dataSource = GroupHierarchyDataSource(root: root, groups: allGroups)

        groupHierarchyView.setDataSource(dataSource)
    }

    func outlineViewSelectionDidChange(notification: NSNotification) {
        var selectedGroup = emptyGroup

        if groupHierarchyView.selectedRow > -1 {
            selectedGroup = groupHierarchyView.itemAtRow(groupHierarchyView.selectedRow) as! KPKGroup
        }

        println("\n Group selected \(selectedGroup)")
        whenGroupSelected?(selectedGroup)
    }
}
