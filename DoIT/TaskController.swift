//
//  TaskController.swift
//  DoIT
//
//  Created by Radoslav Hlinka on 13/11/2017.
//  Copyright © 2017 Radoslav Hlinka. All rights reserved.
//

import UIKit

class TaskController: UIViewController {
    
    var task = Task()
    
    var parentVC = ViewController()
    
    @IBOutlet weak var taskName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName?.text = task.important ?  " ❗️ \(task.name)" : task.name
    }
    
    @IBAction func completeButton(_ sender: Any) {
        parentVC.tasks.remove(at: parentVC.selectedIndex)
        parentVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
}
