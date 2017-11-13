//
//  TaskController.swift
//  DoIT
//
//  Created by Radoslav Hlinka on 13/11/2017.
//  Copyright © 2017 Radoslav Hlinka. All rights reserved.
//

import UIKit

class TaskController: UIViewController {
    
    var task : Task? = nil
    
    var parentVC = ViewController()
    
    @IBOutlet weak var taskName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName?.text = task!.importance ?  " ❗️ \(task!.name!)" : task!.name!
    }
    
    @IBAction func completeButton(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
}
