//
//  GroupsViewController.swift
//  KeePassOSX
//
//  Created by Adriano Bonat on 2/Feb/15.
//  Copyright (c) 2015 Adriano Bonat. All rights reserved.
//

import Foundation
import Cocoa

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
