//
//  AddItemViewController.swift
//  Checkliszts
//
//  Created by Rhodri Thomas on 5/4/24.
//

import UIKit

class AddItemViewController: UITableViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: - Table View Delegates
    override func tableView(
        _ tableView: UITableView,
        willSelectRowAt indexPath: IndexPath
    ) -> IndexPath? {
        return nil
    }
    
    // MARK: - Actions
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func done() {
        print("Contents of the text field: \(textField.text!)")
        navigationController?.popViewController(animated: true)
    }
}
