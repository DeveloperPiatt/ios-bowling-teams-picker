//
//  TableViewController.swift
//  BowlingTeamPicker
//
//  Created by Nick Piatt on 10/22/20.
//  Copyright © 2020 Nick Piatt. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        if (indexPath.row == 0) {
            cell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        }
        
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
