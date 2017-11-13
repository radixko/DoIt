//
//  ViewController.swift
//  DoIT
//
//  Created by Radoslav Hlinka on 13/11/2017.
//  Copyright © 2017 Radoslav Hlinka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks = makeTasks()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.important ?  " ❗️ \(task.name)" : task.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "selectTaskSeque", sender: task)
    }
    
    func makeTasks() -> [Task] {
        let taskOne = Task()
        taskOne.important = true
        taskOne.name = "First task"
        
        let taskTwo = Task()
        taskTwo.important = false
        taskTwo.name = "Second task"
        
        let taskThree = Task()
        taskThree.important = false
        taskThree.name = "Third task"
        
        return [taskOne, taskTwo, taskThree]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
            let nextVC = segue.destination as! AddTaskController
            nextVC.parentVC = self
        }
        if segue.identifier == "selectTaskSeque" {
            let nextVC = segue.destination as! TaskController
            nextVC.parentVC = self
            nextVC.task = sender as! Task
        }
    }
}






