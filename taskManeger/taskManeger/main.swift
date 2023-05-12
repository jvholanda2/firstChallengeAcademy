import Foundation


var bd:BancoDeDados = BancoDeDados()
bd.buildTaskFromFile()
//bd.mockBd()


var TaskApp:TaskList = TaskList(taskList: [])
TaskApp.taskList = bd.bancoTasks

//bd.buildTasksToFile(listTask: TaskApp)

var interface = Interface(taskList: TaskApp)
//interface.busca(textoBuscado: "Task")

while(true) {
    print("\t#Gerenciador de Tarefas#\n")
    print("1.Criar Tarefa\n2.Atualizar Tarefa\n3.Deletar Tarefas\n4.Recuperar tarefa\n5.Listar Tarefas\n6.Marcar Task Como Concluida")
    print("\n")
    var menu: String = ""
    
    if var input: String = readLine() {
        menu = input
    }
    switch menu {
        case "1":
            print("escolheu 1")
            interface.createTask()
        case "2":
            print("escolheu 2")
            interface.updateTask()
        case "3":
            print("escolheu 3")
            interface.deleteTask()
        case "4":
            print("escolheu 4")
            interface.recuperarTask()
        case "5":
            print("escolheu 5")
            interface.listarTarefas(comID: false)
        case "6":
            print("escolheu 6")
            interface.marcarComoConcluida();
    default:
        print("Digite uma opção valida!")
    }
    
    bd.update(listTask: TaskApp)
}
