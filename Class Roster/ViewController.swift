//
//  ViewController.swift
//  Class Roster
//
//  Created by Adnan Aziz on 4/11/15.
//  Copyright (c) 2015 Adnan Aziz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var people = [Person]()
    
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        people.append(Person(firstName: "John", lastName: "Clem"))
        people.append(Person(firstName: "Andrew", lastName: "Bishop"))
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        var personForRow = people[indexPath.row]
        
        cell.textLabel?.text = personForRow.fullName()
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 
        if let destinationVC = segue.destinationViewController as? PersonDetailViewController {
            var personForRow = people[tableView.indexPathForSelectedRow()!.row]
            destinationVC.person = personForRow
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
}