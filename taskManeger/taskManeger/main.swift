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
    
    init(name: String, descriptionTaks: String){
        self.name = name
        self.descritionTask = descriptionTaks
    }
}

var newTaskList: [Task] = []
