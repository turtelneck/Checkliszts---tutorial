//
//  Checkliszt.swift
//  Checkliszts
//
//  Created by Rhodri Thomas on 5/9/24.
//

import UIKit

class Checkliszt: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.isChecked {
            count += 1
        }
        return count
    }
}
