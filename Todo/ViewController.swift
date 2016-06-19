//
//  ViewController.swift
//  Todo
//
//  Created by Mamadou Kaba on 6/18/16.
//  Copyright © 2016 Mamadou Kaba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    //MARK - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    

    //MARK - Properties
    
    //MARK: - Data Source
    var items = [String]()
    //MARK: - View Controller Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       title = "Todos"
        //Register the UITableViewCell class to with the table view. Dequeue a cell with a reuse identifier.
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        cell.textLabel!.text = items[indexPath.row]
        return cell
    }
    
    //MARK: - IBAction

    @IBAction func addItem(sender: AnyObject) {
        let alertController = UIAlertController(title: "Title Item", message: "Add a New Item", preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "Save", style: .Default) { (action) in
            let texfield = alertController.textFields![0] as UITextField
            self.items.append(texfield.text!)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alertController.addAction(alertAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }


}

