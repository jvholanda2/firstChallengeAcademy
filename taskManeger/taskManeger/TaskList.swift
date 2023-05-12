//
//  TaskList.swift
//  taskManeger
//
//  Created by userext on 12/05/23.
//

import Foundation

class TaskList {
    var taskList:[Task] = []
    
    init(taskList:[Task]){
        self.taskList = taskList
    }
    
    func printTasks(){
        taskList.forEach { task in
            task.printTask()
        }
    }
    
    func searchByTitle(titleSearched: String) -> [Int] {
        var res:[Int] = []
        var idx = 0
        for task in taskList {
            if task.title == titleSearched && !task.isDeleted { res.append(idx) }
            idx += 1
        }
        return res
    }
    func searchByDescription(descriptionSearched: String) -> [Int] {
        var res:[Int] = []
        var idx = 0
        for task in taskList {
            if task.description == descriptionSearched && !task.isDeleted { res.append(idx) }
            idx += 1
        }
        return res
    }

}
