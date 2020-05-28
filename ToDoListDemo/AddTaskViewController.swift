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
        
        let toolbarDone = UIToolbar.init()
        
        toolbarDone.sizeToFit()
        
        toolbarDone.barTintColor = UIColor.red
        
        toolbarDone.isTranslucent = false
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let barBtnDone = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        
        barBtnDone.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
        toolbarDone.items = [flexSpace, barBtnDone, flexSpace]
        
        taskNameTextField.inputAccessoryView = toolbarDone
        
        taskDetailsTextView.inputAccessoryView = toolbarDone
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
    
    
    @objc func cancelButtonDidTouch() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTaskDidTouch(_ sender: Any) {
    }
}
