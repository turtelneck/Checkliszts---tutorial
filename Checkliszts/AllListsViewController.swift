//
//  AllListsViewController.swift
//  Checkliszts
//
//  Created by Rhodri Thomas on 5/9/24.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    let cellIdentifier = "ChecklistCell"
    var lists = [Checkliszt]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var list = Checkliszt(name: "Pooppina")
        lists.append(list)

        list = Checkliszt(name: "Pooperaustichoff")
        lists.append(list)

        list = Checkliszt(name: "Pooperino")
        lists.append(list)

        list = Checkliszt(name: "Pooperazzolini")
        lists.append(list)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return lists.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier, 
            for: indexPath)
        let checklist = lists[indexPath.row]
        cell.textLabel!.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }
    
    override func tableView(
      _ tableView: UITableView,
      didSelectRowAt indexPath: IndexPath
    ) {
      performSegue(withIdentifier: "ShowChecklist", sender: nil)
    }
}
