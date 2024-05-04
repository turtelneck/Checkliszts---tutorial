//
//  ChecklistItem.swift
//  Checkliszts
//
//  Created by Rhodri Thomas on 5/4/24.
//

import Foundation

class ChecklistItem {
    var text: String
    var isChecked: Bool
    
    init(_ text: String, _ isChecked: Bool) {
        self.text = text
        self.isChecked = isChecked
    }
}
