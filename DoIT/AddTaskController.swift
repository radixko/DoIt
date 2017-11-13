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
    
    var parentVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTask(_ sender: Any){
        let task = Task()
        task.name = taskTextField.text!
        task.important = importanceSwitch.isOn
        parentVC.tasks.append(task)
        parentVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
}
