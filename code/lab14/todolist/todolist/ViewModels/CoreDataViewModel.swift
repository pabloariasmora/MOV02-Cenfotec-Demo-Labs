//
//  CoreDataViewModel.swift
//  todolist
//
//  Created by Juan Pablo Arias Mora on 3/26/21.
//

import Foundation

class CoreDataViewModel: ObservableObject{
    @Published var coreDM = CoreDataManager()
    @Published var tasks: [TaskEntity] = [TaskEntity]()
    
    
    func saveTask(title: String, description:String, priority:String){
        //Validations
        coreDM.saveTask(title: title, description: description, priority: priority)
    }
    
    func getAllTask(){
        tasks = self.coreDM.getAllTask()
    }
    
    func deleteTask(task:TaskEntity){
        //Validations
        coreDM.deleteTask(task: task)
    }
    
}
