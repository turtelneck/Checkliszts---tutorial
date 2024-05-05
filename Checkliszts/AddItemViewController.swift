//
//  AddItemViewController.swift
//  Checkliszts
//
//  Created by Rhodri Thomas on 5/4/24.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Actions
    @IBAction func cancel() {
      navigationController?.popViewController(animated: true)
    }

    @IBAction func done() {
      navigationController?.popViewController(animated: true)
    }
}
