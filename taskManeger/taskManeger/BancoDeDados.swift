//
//  BancoDeDados.swift
//  taskManeger
//
//  Created by userext on 12/05/23.
//

import Foundation

class BancoDeDados {
    var bancoTasks:[Task] = []
    // ler um arquivo de texto
    // escrever em um arquivo de texto
    let fileName:String = "data.txt"
    let mock:String = ""
    var fileContents:String = ""
    
    func readText(){
        // procura o arquivo, se nao acha, ele cria.
        // le o texto dentro do arquivo, monta o objeto e retorna a lista.
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            
            do {
                let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
                //print("Conteúdo do arquivo: \(fileContents)")
                self.fileContents = fileContents
                print("Arquivo lido com sucesso!")
                
            } catch {
                self.createFile()
                self.readText()
            }
        }
    }
    
    func buildTasksToFile(listTask:TaskList){
        // montar dentro do arquivo as tasks.
        var content:String = ""
        listTask.taskList.forEach { task in
            content += task.taskToString() + "\n"
        }
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent(fileName)
            
            do {
                try content.write(to: fileURL, atomically: true, encoding: .utf8)
                print("Escrita concluída com sucesso!")
            } catch {
                print("Erro ao escrever no arquivo: \(error)")
            }
        }
    }
    
    func buildTaskFromFile(){
        self.readText()
        let lines = fileContents.components(separatedBy: "\n")
        lines.forEach { line in
            if(line.count == 0) {return}
            let attributes = line.components(separatedBy: ",")
            var title:String = ""
            var desc:String = ""
            var status:Bool = false
            var isDeleted:Bool = false
            attributes.forEach { attribute in
                let aux = attribute.components(separatedBy: ":")
                if (aux[0] == "titulo"){
                    title = aux[1]
                } else if (aux[0] == "descricao"){
                    desc = aux[1]
                } else if (aux[0] == "status"){
                    status = aux[1] == "false" ? false : true
                } else {
                    isDeleted = aux[1] == "false" ? false : true
                }
            }
            let task = Task(title: title, description: desc, status: status, isDeleted: isDeleted)
            bancoTasks.append(task)
        }
    }
    
    func update(listTask: TaskList){
        // altera o banco no final da aplicacao
        self.buildTasksToFile(listTask: listTask)
        print("Salvando alterações no arquivo.")
        
    }

    
    func createFile(){
        print("Inicializando o banco de dados!")
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            print(fileURL)
            
            do {
                try mock.write(to: fileURL, atomically: false, encoding: .utf8)
                print("Arquivo criado com sucesso!")
            } catch {
                print("Erro ao incializar o banco: \(error)")
            }
        }
        print("Banco Inicializado com sucesso! :)")
    }
    
    func mockBd(){
        var mockListTasks:[Task] = [
            Task(title: "Task", description: "Desc"),
            Task(title: "Task", description: "Desc"),
            Task(title: "Task3", description: "Desc"),
        ]
        var mockClass = TaskList(taskList: mockListTasks)
        self.buildTasksToFile(listTask: mockClass)
    }

}
