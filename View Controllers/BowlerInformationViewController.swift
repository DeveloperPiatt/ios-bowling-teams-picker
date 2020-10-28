//
//  BowlerInformationViewController.swift
//  BowlingTeamPicker
//
//  Created by Nick Piatt on 10/25/20.
//  Copyright © 2020 Nick Piatt. All rights reserved.
//

import UIKit

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

class BowlerInformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bowlers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:TableRowViewController!
        cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? TableRowViewController
        
        let bowler = bowlers[indexPath.row]
        
        cell.nameLabel.text = bowler["name"]
        cell.frameLabel.text = bowler["frame"]
        cell.fscoreLabel.text = bowler["fscore"]
        
        cell.nameButton.addTarget(self, action: #selector(showAlert(sender:)), for: UIControl.Event.touchUpInside)
        cell.frameButton.addTarget(self, action: #selector(setFrameScore(sender:)), for: UIControl.Event.touchUpInside)
        cell.fscoreButton.addTarget(self, action: #selector(setFinalScore(sender:)), for: UIControl.Event.touchUpInside)
        cell.nameButton.tag = indexPath.row
        cell.frameButton.tag = indexPath.row
        cell.fscoreButton.tag = indexPath.row
        print("Test \(indexPath.row)")
        
        return cell
    }
    
    
    var allBowlers: Array<String> = Array<String>()
    var bowlers: [[String:String]] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addBowlerButton: UIButton!
    @IBAction func ClearScoresAction(_ sender: Any) {
        for i in 0...bowlers.count-1 {
            var bowler = bowlers[i]
            bowler["frame"] = ""
            bowler["fscore"] = ""
            bowlers[i] = bowler
        }
        self.tableView.reloadData()
    }
    @IBAction func AddBowlerAction(_ sender: Any) {
        // Create Alert
        let dialogMessage = UIAlertController(title: "Add Bowler", message: "Enter a Name", preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            let textField = dialogMessage.textFields![0]
            if textField.text != "" {
//                self.allBowlers.append(textField.text!)
                self.bowlers.append(["name":textField.text ?? "Error", "frame":"---", "fscore":"---"])
                self.tableView.reloadData()
            }
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
    @IBAction func RemoveBowlerAction(_ sender: Any) {
        // Create Alert
        let dialogMessage = UIAlertController(title: "Remove Bowlers", message: "Are you sure you want to remove all bowlers?", preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            self.bowlers = []
            self.tableView.reloadData()
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
        
//        if allBowlers.count == 0 {
//            print("Adding Bowlers")
//            allBowlers.append("Nick")
//            allBowlers.append("Zac")
//            allBowlers.append("Amanda")
//            allBowlers.append("Ryan")
//        }
        
        if bowlers.count == 0 {
            print("Adding Bowlers")
            bowlers.append(["name":"Nick", "frame":"---", "fscore":"---" ])
            bowlers.append(["name":"Ryan", "frame":"---", "fscore":"---" ])
            bowlers.append(["name":"Zac", "frame":"---", "fscore":"---" ])
            bowlers.append(["name":"Amanda", "frame":"---", "fscore":"---" ])
        }
        
        print("Done Setting Data")
    }
    
    @objc func showAlert(sender:UIButton!)
    {
        
        // Create Alert
        let dialogMessage = UIAlertController(title: "Set Name", message: "Enter a Name", preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            let textField = dialogMessage.textFields![0]
            print(sender.tag)
            
            var bowler = self.bowlers[sender.tag]
            bowler["name"] = textField.text ?? "Error"
            self.bowlers[sender.tag] = bowler

            self.tableView.reloadData()
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
    
    @objc func setFrameScore(sender:UIButton!)
    {
        
        // Create Alert
        let dialogMessage = UIAlertController(title: "4th Frame Score", message: "Enter a Score", preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            let textField = dialogMessage.textFields![0]
            print(sender.tag)
            
            var bowler = self.bowlers[sender.tag]
            
            if textField.text?.isInt ?? false {
                bowler["frame"] = textField.text ?? "Error"
                self.bowlers[sender.tag] = bowler
                self.tableView.reloadData()
            }
            
            
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
    
    @objc func setFinalScore(sender:UIButton!)
    {
        
        // Create Alert
        let dialogMessage = UIAlertController(title: "Final Score", message: "Enter a Score", preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            let textField = dialogMessage.textFields![0]
            print(sender.tag)
            
            var bowler = self.bowlers[sender.tag]
            
            if textField.text?.isInt ?? false {
                bowler["fscore"] = textField.text ?? "Error"
                self.bowlers[sender.tag] = bowler
                self.tableView.reloadData()
            }
            
            
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
