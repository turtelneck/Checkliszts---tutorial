//
//  DataModel.swift
//  Checkliszts
//
//  Created by Rhodri Thomas on 5/13/24.
//

import Foundation

class DataModel {
    var lists = [Checkliszt]()
    
    var indexOfSelectedList: Int {
        get {
            return UserDefaults.standard.integer(forKey: "ChecklistIndex")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "ChecklistIndex")
        }
    }
    
    init() {
        loadChecklists()
        registerDefaults()
        handleFirstTime()
    }
    
    func registerDefaults() {
        let dictionary = [ 
            "ChecklistIndex": -1,
            "FirstTime": true
        ] as [String: Any]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    //MARK: User's First Time Opening App
    func handleFirstTime() {
        let userDefaults = UserDefaults.standard
        let firstTime = userDefaults.bool(forKey: "FirstTime")
        
        if firstTime {
            let checklist = Checkliszt(name: "List")
            lists.append(checklist)
            
            indexOfSelectedList = 0
            userDefaults.set(false, forKey: "FirstTime")
        }
    }
    
    //MARK: Sorting
    func sortChecklists() {
        lists.sort { list1, list2 in
            return list1.name.localizedStandardCompare(list2.name) == .orderedAscending
        }
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
                sortChecklists()
            } catch {
                print("Error decoding item from array: \(error.localizedDescription)")
            }
        }
    }
}


