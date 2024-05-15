//
//  ChecklistItem.swift
//  Checkliszts
//
//  Created by Rhodri Thomas on 5/4/24.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var isChecked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1

    
    init(_ text: String, _ isChecked: Bool) {
        self.text = text
        self.isChecked = isChecked
    }
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
}
