//
//  ViewTaskViewController.swift
//  DoIt
//
//  Created by Mark Janes on 13/04/2017.
//  Copyright © 2017 The Light Machine. All rights reserved.
//

import UIKit

class ViewTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var task = Task()
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if task.important {
            taskLabel.text = "❗️\(task.name)"
        } else {
            taskLabel.text = task.name
        }
    }
    
    @IBAction func completeButton(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
}
