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
    func printTask(){
        if !self.isDeleted {
            print("titulo: \(self.title) | description: \(self.description) | status : \(self.status)")
        }
    }
}




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
    
    func searchByTitle(titleSearched: String) -> Optional<Int> {
        return self.taskList.firstIndex { $0.title == titleSearched }    }
    func searchByDescription(descriptionSearched: String) -> Optional<Int> {
        return self.taskList.firstIndex { $0.description == descriptionSearched }    }

}

class Interface{
    var taskList:TaskList
    
    init(taskList: TaskList) {
        self.taskList = taskList
    }
    
    func showSearch(string:String){
        // faz a busca
        // mostra pro usuario para cada indice, as tasks.
    }
}



var listTask = TaskList(taskList: [
    Task(title: "Task1", description: "Desc1"),
    Task(title: "Task2", description: "Desc2"),
    Task(title: "Task3", description: "Desc3"),
])

