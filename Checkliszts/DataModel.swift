//
//  DataModel.swift
//  Checkliszts
//
//  Created by Rhodri Thomas on 5/13/24.
//

import Foundation

class DataModel {
    var lists = [Checkliszt]()
    
    init() {
        loadChecklists()
        registerDefaults()
    }
    
    func registerDefaults() {
        let dictionary = [ "ChecklistIndex": -1 ]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    //MARK: For Saving Checklists
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask)
        return paths[0]
    }

    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checkliszts.plist")
    }

    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            try data.write(
                to: dataFilePath(),
                options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }

    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode(
                    [Checkliszt].self,
                    from: data)
            } catch {
                print("Error decoding item from array: \(error.localizedDescription)")
            }
        }
    }
}


