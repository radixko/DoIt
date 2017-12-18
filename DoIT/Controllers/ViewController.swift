//
//  ViewController.swift
//  DoIT
//
//  Created by Radoslav Hlinka on 13/11/2017.
//  Copyright © 2017 Radoslav Hlinka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let image = UIImage(named: "DSC_0351.JPG")!.withRenderingMode(.alwaysTemplate)
    private let topMessage = "Notes"
    private let bottomMessage = "You don't have any notes yet. All your notes will show up here."
    
    func setupEmptyBackgroundView() {
        let emptyBackgroundView = EmptyBackgroundView(top: topMessage, bottom: bottomMessage)
        tableView.backgroundView = emptyBackgroundView
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupEmptyBackgroundView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tasks.count == 0 {
            tableView.separatorStyle = .none
            tableView.backgroundView?.isHidden = false
        } else {
            tableView.separatorStyle = .singleLine
            tableView.backgroundView?.isHidden = true
        }
        
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.importance ?  " ❗️ \(task.name!)" : task.name!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "selectTaskSeque", sender: task)
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectTaskSeque" {
            let nextVC = segue.destination as! TaskController
            nextVC.parentVC = self
            nextVC.task = (sender as? Task)!
        }
    }
    
    private func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        } catch {}
    }
}






