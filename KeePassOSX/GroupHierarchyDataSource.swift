//
//  GroupHierarchyDataSource.swift
//  KeePassOSX
//
//  Created by Adriano Bonat on 2/Feb/15.
//  Copyright (c) 2015 Adriano Bonat. All rights reserved.
//

import Foundation
import Cocoa

class GroupHierarchyDataSource: NSObject, NSOutlineViewDataSource {
    let groups: [KPKGroup]
    let root: KPKGroup

    init(root: KPKGroup, groups: [KPKGroup]) {
        self.root = root
        self.groups = groups
    }

    func outlineView(outlineView: NSOutlineView, numberOfChildrenOfItem item: AnyObject?) -> Int {
        let result = item == nil ? 1 : (item as KPKGroup).groups.count

        return result
    }

    func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: AnyObject?) -> AnyObject {
        return item == nil ? root : (item as KPKGroup).groups[index]
    }

    func outlineView(outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool {
        return (item as KPKGroup).groups.count > 0
    }

    func outlineView(outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn?, byItem item: AnyObject?) -> AnyObject? {

        if let item = item as? KPKGroup {
            return item.name
        }
        return nil
    }

    deinit {
        println("Goodbye datasource!")
    }
}
