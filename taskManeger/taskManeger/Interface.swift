//
//  Interface.swift
//  taskManeger
//
//  Created by userext on 12/05/23.
//

import Foundation

class Interface {
    var taskList:TaskList
    
    init(taskList: TaskList) {
        self.taskList = taskList
    }
    
    func listarTarefas(comID:Bool) {
        if taskList.taskList.count == 0 {
            print("\n")
            print("Sua lista de tarefas está vazia!")
            print("\n")
            return
        }
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
    func listarTarefasExcluidas(comID:Bool) {
        if taskList.taskList.count == 0 {
            print("\n")
            print("Sua lista de tarefas está vazia!")
            print("\n")
            return
        }
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
    
    func createTask() {
        let newTask: Task = Task(title: "", description: "")
        print("Digite o título da tarefa:")
        if let newTitle: String = readLine() {
            newTask.title = newTitle
        }
        print("Digite a descrição da tarefa:")
        if let newDescription: String = readLine() {
            newTask.description = newDescription
        }
        taskList.taskList.append(newTask)
        print("Parabéns! Você criou uma nova tarefa!")
        print("\t")
        print("Título: \(newTask.title)")
        print("Descrição: \(newTask.description)")
        print("\t")
    }
    
    func deleteTask() {
        if taskList.taskList.count == 0 {
            print("\n")
            print("Sua lista de tarefas está vazia!")
            print("\n")
            return
        }
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
    
    func updateTask() {
        // Listar todas e pedir ao usuario para escolher uma!
        if taskList.taskList.count == 0 {
            print("\n")
            print("Sua lista de tarefas está vazia!")
            print("\n")
            return
        }
        self.listarTarefas(comID:true)
        print("Qual deseja escolher ?")
        var idTask:Int
        if let input = readLine(), let number = Int(input) {
            idTask = number
        } else{
            print("Digite uma opção valida")
            return updateTask()
        }
        //corrigir aqui
        //if taskList.taskList[idTask] != nil {
        //    print("")
        //}
        let taskModified: Task = taskList.taskList[idTask]
        print("Digite o novo título:")
        if let titleModified = readLine() {
            if titleModified.count > 0 {
                taskModified.title = titleModified
            }
        }
        print("Digite a nova descrição:")
        if let descriptionModified = readLine() {
            if descriptionModified.count > 0 {
               taskModified.description = descriptionModified
            }
        }
        
        print("Parabens! Você atualizou sua tarefa!")
    }
    
    func busca(textoBuscado:String) -> Int {
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
        while(true) {
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
    
    func marcarComoConcluida() {
        if taskList.taskList.count == 0 {
            print("\n")
            print("Sua lista de tarefas está vazia!")
            print("\n")
            return
        }
        self.listarTarefas(comID:true)
        print("Qual tarefa deseja alterar o status?")
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
    
    func recuperarTask() {
        if taskList.taskList.count == 0 {
            print("\n")
            print("Sua lista de tarefas está vazia!")
            print("\n")
            return
        }
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

