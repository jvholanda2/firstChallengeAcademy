//
//  Task.swift
//  taskManeger
//
//  Created by userext on 12/05/23.
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

    init(title: String, description: String, status: Bool, isDeleted: Bool){
        self.title = title
        self.description = description
        self.status = status
        self.isDeleted = isDeleted
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
    func printTask(id:Int){
        if !self.isDeleted {
            print("ID : \(id) | titulo: \(self.title) | description: \(self.description) | status : \(self.status)")
        }
    }
    
    func printTaskExcluida(id:Int){
        if self.isDeleted {
            print("ID : \(id) | titulo: \(self.title) | description: \(self.description) | status : \(self.status)")
        }
    }
    
    func taskToString() -> String{
        let content:String = "titulo:\(self.title),descricao:\(self.description),status:\(self.status),isDeleted:\(self.isDeleted)"
        return content
    }

    func recoverTask(){
        self.isDeleted = !self.isDeleted
    }
}
