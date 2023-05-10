//
//  main.swift
//  taskManeger
//
//  Created by userext on 09/05/23.
//

import Foundation


class Task {
    var title: String
    var descritionTask: String
    var status: Bool = false
    var isDeleted: Bool
    
    
    init(title: String, descriptionTaks: String, status: Bool, isDeleted: Bool){
        self.title = title
        self.descritionTask = descriptionTaks
        self.status = status
        self.isDeleted = isDeleted
    }
}

var taskList: [Task] = [Task()]
