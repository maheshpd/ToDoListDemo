//
//  ToDoItemModel.swift
//  ToDoListDemo
//
//  Created by Mahesh Prasad on 27/05/20.
//  Copyright © 2020 CreatesApp. All rights reserved.
//

import Foundation

struct ToDoItemModel {
    var name: String
    
    var details: String
    
    var completionDate: Date
    
    var startDate: Date
    
    var isComplete: Bool
    
    init(name: String, details: String, completionDate: Date) {
        self.name = name
        self.details = details
        self.completionDate = completionDate
        self.isComplete = false
        self.startDate = Date()
    }
}
