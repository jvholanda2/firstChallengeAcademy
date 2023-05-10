//
//  main.swift
//  taskManeger
//
//  Created by userext on 09/05/23.
//

import Foundation


class Task {
    var title: String
    var description: String
    var status: Bool = false
    var isDeleted: Bool = false
    
    
    init(title: String, description: String){
        self.title = title
        self.description = description
    }
    
    func updateTask(task: Task){
        self.title = task.title
        self.description = task.description
        
        //printTask()
    }
    
    func changeStatus(){
        self.status = !self.status
    }
}




class TaskList {
    var taskList:[Task] = []
    
    init(taskList:[Task]){
        self.taskList = taskList
    }
    
    func printTask(){
        taskList.forEach { Task in
            print("titulo: \(Task.title) | description: \(Task.description) | status : \(Task.status)")
        }
    }
    

}


var listTask = TaskList(taskList: [
    Task(title: "Task1", description: "Desc1"),
    Task(title: "Task2", description: "Desc2"),
    Task(title: "Task3", description: "Desc3"),
])


