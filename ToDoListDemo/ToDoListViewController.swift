//
//  ToDoListViewController.swift
//  ToDoListDemo
//
//  Created by Mahesh Prasad on 27/05/20.
//  Copyright © 2020 CreatesApp. All rights reserved.
//

import UIKit

protocol ToDoListDelegate: class {
    func update(task: ToDoItemModel, index: Int)
}


class ToDoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var toDoItems: [ToDoItemModel] = [ToDoItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        title = "To Do List"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        
        let testItem = ToDoItemModel(name: "Test Item", details: "Test Details", completionDate: Date())
        
        self.toDoItems.append(testItem)
        
        let tesstItem2 = ToDoItemModel(name: "Test Item2", details: "Test Details2", completionDate: Date())
        
        self.toDoItems.append(tesstItem2)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tableView.setEditing(false, animated: false)
        
    }
    
    
    @objc func addTapped() {
        performSegue(withIdentifier: "AddTaskSegue", sender: nil)
    }
    
    @objc func editTapped() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        
        if tableView.isEditing == true {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editTapped))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedItem = toDoItems[indexPath.row]
        
        let toDoTuple = (indexPath.row, selectedItem)
        
        performSegue(withIdentifier: "TaskDetailsSegue", sender: toDoTuple)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            self.toDoItems.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
        }
        
        return[delete]
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "TaskDetailsSegue" {
            guard let detinationVC = segue.destination as? ToDoDetailsViewController else {return}
            
            guard let toDoTuple = sender as? (Int, ToDoItemModel) else {return}
            
            detinationVC.toDoIndex = toDoTuple.0
            
            detinationVC.toDoItem = toDoTuple.1
            
            detinationVC.delegate = self
            
        }
        
    }
}

extension ToDoListViewController: ToDoListDelegate {
    
    func update(task: ToDoItemModel, index: Int) {
        toDoItems[index] = task
        
        tableView.reloadData()
    }
}
