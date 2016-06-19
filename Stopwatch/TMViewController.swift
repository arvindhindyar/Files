//
//  TMViewController.swift
//  Stopwatch
//
//  Created by Arvind Kumar on 19/06/16.
//  Copyright © 2016 hindyar. All rights reserved.
//

import UIKit

class TMViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
     @IBOutlet weak var RolesTableView: UITableView!
    let roles = ["Prepared Speech","Table Topic","Speech Evaluation","Grammarian Report","Ah Counter Report","General Evaluator Report"]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = roles[indexPath.row]
        switch indexPath.row{
        case 0:
           cell.detailTextLabel!.text = "Time : 5-7 minutes"
        case 1:
            cell.detailTextLabel!.text = "Time : 1-2 minutes"
        case 2:
            cell.detailTextLabel!.text = "Time : 2-3 minutes"
        case 3:
            cell.detailTextLabel!.text = "Time : 2-3 minutes"
        case 4:
            cell.detailTextLabel!.text = "Time : 1-2 minutes"
        case 5:
            cell.detailTextLabel!.text = "Time : 8-10 minutes"
        default:
            cell.detailTextLabel!.text = "N/A"
        }
        
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("stopwatch", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    override func viewDidLoad() {
        // 
        RolesTableView.delegate = self
       
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "stopwatch", let destination = segue.destinationViewController as? ViewController {
            if let cell = sender as? UITableViewCell, let indexPath = RolesTableView.indexPathForCell(cell) {
                let role = roles[indexPath.row]
                destination.barTitle = role
            }
        }
    }
}
