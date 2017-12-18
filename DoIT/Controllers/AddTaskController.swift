//
//  AddTaskController.swift
//  DoIT
//
//  Created by Radoslav Hlinka on 13/11/2017.
//  Copyright © 2017 Radoslav Hlinka. All rights reserved.
//

import UIKit

class AddTaskController: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var importanceSwitch: UISwitch!
    @IBOutlet weak var addButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTask(_ sender: Any){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = taskTextField.text
        task.importance = importanceSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
}
