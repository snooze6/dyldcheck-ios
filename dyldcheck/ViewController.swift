//
//  ViewController.swift
//  dyldcheck
//
//  Created by Snooze on 23/08/2019.
//  Copyright © 2019 Snooze. All rights reserved.
//

import UIKit
import Security

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var showall: UISwitch!
    
    var showingLibs = [String]()
    var libs = getLibs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        showingLibs = getLibs()
    }

    @IBAction func pushed(_ sender: Any) {
        NSLog("reloading")
        let value = !showall.isOn
        if (value){
            NSLog("Showing all")
            showingLibs = getLibs()
        } else {
            NSLog("Showing only new")
            showingLibs = ["A","B","C"]
        }
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showingLibs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
        cell.textLabel?.text  = String(showingLibs[indexPath.row].split(separator: "/").last ?? "nil")
        return cell
    }
    
}

