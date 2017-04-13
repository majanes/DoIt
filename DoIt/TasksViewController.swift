//
//  ViewController.swift
//  DoIt
//
//  Created by Mark Janes on 10/04/2017.
//  Copyright © 2017 The Light Machine. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        if task.important {
            cell.textLabel?.text = "❗️ \(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy cheese"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Think alot"
        task3.important = true
        
        return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row \(indexPath.row) selected")
        selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "selectTaskSegue", sender: tasks[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            print("prepare for addSegue")
            let nextVC = segue.destination as! NewTaskViewController
            nextVC.previousVC = self
        }
        
        if segue.identifier == "selectTaskSegue" {
            print("prepare for selectTaskSegue")
            let nextVC = segue.destination as! ViewTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
}

