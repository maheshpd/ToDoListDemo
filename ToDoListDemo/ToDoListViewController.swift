//
//  ToDoListViewController.swift
//  ToDoListDemo
//
//  Created by Mahesh Prasad on 27/05/20.
//  Copyright © 2020 CreatesApp. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var toDoItems: [ToDoItemModel] = [ToDoItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        title = "To Do List"
        
        let testItem = ToDoItemModel(name: "Test Item", details: "Test Details", completionDate: Date())
        
        self.toDoItems.append(testItem)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "TaskDetailsSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let toDoItem = toDoItems[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItem")!
        
        cell.textLabel?.text = toDoItem.name
        cell.detailTextLabel?.text = toDoItem.isComplete ? "Complete" : "Incomplete"
        
        return cell
    }
    
}
