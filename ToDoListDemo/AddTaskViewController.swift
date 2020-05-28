//
//  AddTaskViewController.swift
//  ToDoListDemo
//
//  Created by Mahesh Prasad on 27/05/20.
//  Copyright © 2020 CreatesApp. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var taskDetailsTextView: UITextView!
    
    @IBOutlet weak var taskCompletionDatePicker: UIDatePicker!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let navigationItem = UINavigationItem(title: "Add Task")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonDidTouch))
        
        navigationBar.items = [navigationItem]
        
        taskDetailsTextView.layer.borderColor = UIColor.lightGray.cgColor
        taskDetailsTextView.layer.borderWidth = CGFloat(1)
        
        taskDetailsTextView.layer.cornerRadius = CGFloat(3)
        
    }
    
    @objc func cancelButtonDidTouch() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTaskDidTouch(_ sender: Any) {
    }
}
