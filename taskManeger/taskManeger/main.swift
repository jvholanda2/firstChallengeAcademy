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
    print("1.Criar Tarefa\n2.Atualizar Tarefa\n3.Deletar Tarefas\n4.Recuperar Tarefa\n5.Listar Tarefas\n6.Mudar Status da Tarefa")
    print("\n")
    var menu: String = ""
    
    if var input: String = readLine() {
        menu = input
    }
    switch menu {
        case "1":
            print("\t#Criar uma nova tarefa#")
            interface.createTask()
        case "2":
            print("\t#Atualizar tarefa#")
            interface.updateTask()
        case "3":
            print("\t#Deletar tarefa#")
            interface.deleteTask()
        case "4":
            print("\t#Recuperar tarefa#")
            interface.recuperarTask()
        case "5":
            print("\t#Listar tarefas#")
            interface.listarTarefas(comID: false)
        case "6":
            print("\t#Mudar status da tarefa#")
            interface.marcarComoConcluida();
    default:
        print("Digite uma opção valida!")
    }
    
    bd.update(listTask: TaskApp)
}
