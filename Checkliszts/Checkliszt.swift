//
//  Checkliszt.swift
//  Checkliszts
//
//  Created by Rhodri Thomas on 5/9/24.
//

import UIKit

class Checkliszt: NSObject {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
