//
//  BowlerInformationViewController.swift
//  BowlingTeamPicker
//
//  Created by Nick Piatt on 10/25/20.
//  Copyright © 2020 Nick Piatt. All rights reserved.
//

import UIKit

class BowlerInformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBowlers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:TableRowViewController!
        cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? TableRowViewController
        
        cell.nameLabel.text = allBowlers[indexPath.row]
        cell.frameLabel.text = "---"
        cell.fscoreLabel.text = "---"
        
//        deerNameCell.detialsInfoButton.addTarget(self, action: "showAlert:", forControlEvents:UIControlEvents.TouchUpInside)
        cell.nameButton.addTarget(self, action: #selector(showAlert(sender:)), for: UIControl.Event.touchUpInside)
        cell.nameButton.tag = indexPath.row
        
        return cell
    }
    
    
    var allBowlers: Array<String> = Array<String>()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addBowlerButton: UIButton!
    @IBAction func AddBowlerAction(_ sender: Any) {
        
    }
    @IBAction func RemoveBowlerAction(_ sender: Any) {
        // Create Alert
        let dialogMessage = UIAlertController(title: "Remove Bowlers", message: "Are you sure you want to remove all bowlers?", preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
        })
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        //Add OK and Cancel button to an Alert object
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        // Present alert message to user
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setDummyData()
        tableView.reloadData()
    }
    
    func setDummyData() {
        print("Setting Dummy Data")
        
        if allBowlers.count == 0 {
            print("Adding Bowlers")
            allBowlers.append("Nick")
            allBowlers.append("Zac")
            allBowlers.append("Amanda")
            allBowlers.append("Ryan")
        }
        
        print("Done Setting Data")
    }
    
    @objc func showAlert(sender:UIButton!)
    {
//        let alert = UIAlertController(title: "Testing", message: "My Message", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//
//        self.present(alert, animated: true, completion: nil)
        
        // Create Alert
        let dialogMessage = UIAlertController(title: "Set Name", message: "Enter a Name", preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            let textField = dialogMessage.textFields![0]
            print(sender.tag)
            
            let aIndexPath = IndexPath(row: sender.tag, section: 0)
            
            let myRow = self.tableView.cellForRow(at: aIndexPath) as? TableRowViewController
            
            myRow?.nameLabel.text = textField.text
            
        })
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        dialogMessage.addTextField { (textField) in
            textField.text = ""
        }
        
        //Add OK and Cancel button to an Alert object
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        // Present alert message to user
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
}
