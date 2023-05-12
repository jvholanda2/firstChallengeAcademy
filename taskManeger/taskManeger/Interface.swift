//
//  Interface.swift
//  taskManeger
//
//  Created by userext on 12/05/23.
//

import Foundation

class Interface{
    var taskList:TaskList
    
    init(taskList: TaskList) {
        self.taskList = taskList
    }
    
    func showSearch(string:String){
        // faz a busca
        // mostra pro usuario para cada indice, as tasks.
    }
    
    func listarTarefas(comID:Bool){
        if comID {
            let max:Int = taskList.taskList.count - 1
            print(max)
            (0...max).forEach { idx in
                taskList.taskList[idx].printTask(id:idx)
            }
        } else {
            taskList.printTasks()
        }
    }
    func listarTarefasExcluidas(comID:Bool){
        if comID {
            let max:Int = taskList.taskList.count - 1
            print(max)
            (0...max).forEach { idx in
                taskList.taskList[idx].printTaskExcluida(id:idx)
            }
        } else {
            taskList.printTasks()
        }
    }
    
    func createTask() -> Task{
        let newTask: Task = Task(title: "", description: "")
        print("Digite o título da tarefa:")
        if var newTitle: String = readLine() {
            newTask.title = newTitle
        }
        print("Digite a descriçao da tarefa:")
        if var newDescription: String = readLine() {
            newTask.description = newDescription
        }
        taskList.taskList.append(newTask)
        print("Parabéns! Você criou uma nova tarefa!")
        print("Título: \(newTask.title)")
        print("Descrição: \(newTask.description)")
        return newTask
    }
    
    func deleteTask(){
        self.listarTarefas(comID:true)
        print("Qual deseja deletar ?")
        var idTask:Int
        if let input = readLine(), let number = Int(input) {
            idTask = number
        } else {
            print("Digite uma opção valida")
            return deleteTask()
        }
        taskList.taskList[idTask].isDeleted = true
        print("A tarefa foi deletada!")
    }
    
    func updateTask(){
        // Listar todas e pedir ao usuario para escolher uma!
        self.listarTarefas(comID:true)
        print("Qual deseja escolher ?")
        var idTask:Int
        if let input = readLine(), let number = Int(input) {
            idTask = number
        } else {
            print("Digite uma opção valida")
            return updateTask()
        }
        var taskModified: Task = taskList.taskList[idTask]
        print("Digite o novo título:")
        if var titleModified = readLine() {
            taskModified.title = titleModified
        }
        print("Digite a nova descrição:")
        if var descriptionModified = readLine() {
            taskModified.description = descriptionModified
        }
        
        print("Parabens! Você atualizou sua tarefa!")
    }
    
    func busca(textoBuscado:String) -> Int{
        //continua ate o usuario escolher somente um.
        var res = taskList.searchByDescription(descriptionSearched: textoBuscado)
        print(res)
        taskList.searchByTitle(titleSearched: textoBuscado).forEach { idx in
            res.append(idx)
        }
        print(res)
        if (res.count == 0) {
            print("Não encontramos nenhuma opção com o texto buscado! Digite uma nova busca:")
            if let input = readLine(){
                return busca(textoBuscado: input)
            }
        }
        
        print("Qual voce deseja escolher:")
        while(true){
            res.forEach { idx in
                taskList.taskList[idx].printTask(id:idx)
            }
            var idx:Int
            if let input = readLine(), let number = Int(input) {
                idx = number
                return idx
            } else {
                print("Entrada invalida! Por favor digite novamente.")
            }
        }
    }
    
    func marcarComoConcluida(){
        self.listarTarefas(comID:true)
        print("Qual deseja marcar como concluida ?")
        var idTask:Int
        if let input = readLine(), let number = Int(input) {
            idTask = number
        } else {
            print("Digite uma opção valida")
            return marcarComoConcluida()
        }
        taskList.taskList[idTask].changeStatus()
        taskList.taskList[idTask].printTask()
        print("Tarefa Atualizada com sucesso")
    }
    
    func recuperarTask(){
        self.listarTarefasExcluidas(comID:true)
        print("Qual deseja recuperar como concluida ?")
        var idTask:Int
        if let input = readLine(), let number = Int(input) {
            idTask = number
        } else {
            print("Digite uma opção valida")
            return recuperarTask()
        }
        taskList.taskList[idTask].recoverTask()
        taskList.taskList[idTask].printTask()
        print("Tarefa Recuperada com sucesso")
    }
}

