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
    //MARK: Variables
    var allBowlers: Array<String> = Array<String>()
    var bowlers: [[String:String]] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBowlerButton: UIButton!
    
    //MARK: Table Data Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bowlers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:TableRowViewController!
        cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? TableRowViewController
        
        let bowler = bowlers[indexPath.row]
        
        cell.nameLabel.text = bowler["name"]
        cell.frameLabel.text = bowler["frame"]
        cell.tiebreakerLabel.text = bowler["tiebreaker"]
        cell.fscoreLabel.text = bowler["fscore"]
        
        cell.nameButton.addTarget(self, action: #selector(showAlert(sender:)), for: UIControl.Event.touchUpInside)
        cell.frameButton.addTarget(self, action: #selector(setFrameScore(sender:)), for: UIControl.Event.touchUpInside)
        cell.tiebreakerButton.addTarget(self, action: #selector(setTiebreaker(sender:)), for: UIControl.Event.touchUpInside)
        cell.fscoreButton.addTarget(self, action: #selector(setFinalScore(sender:)), for: UIControl.Event.touchUpInside)
        
        cell.nameButton.tag = indexPath.row
        cell.frameButton.tag = indexPath.row
        cell.tiebreakerButton.tag = indexPath.row
        cell.fscoreButton.tag = indexPath.row
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            bowlers.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            retagButtonsInTableRows()
        }
    }
    func setDummyData() {
            print("Setting Dummy Data")
            if bowlers.count == 0 {
                print("Adding Bowlers")
                bowlers.append(["name":"Nick", "frame":"---", "tiebreaker":"---", "fscore":"---" ])
                bowlers.append(["name":"Ryan", "frame":"---", "tiebreaker":"---", "fscore":"---" ])
                bowlers.append(["name":"Zac", "frame":"---", "tiebreaker":"---", "fscore":"---" ])
                bowlers.append(["name":"Amanda", "frame":"---", "tiebreaker":"---", "fscore":"---" ])
            }
            
            print("Done Setting Data")
        }
    
    //MARK: Table Cell Functions
    @objc func showAlert(sender:UIButton!) {
        
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
    @objc func setFrameScore(sender:UIButton!) {
        
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
    @objc func setTiebreaker(sender:UIButton!) {
        
        // Create Alert
        let dialogMessage = UIAlertController(title: "Tiebreaker Score", message: "Enter a Score", preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            let textField = dialogMessage.textFields![0]
            print(sender.tag)
            
            var bowler = self.bowlers[sender.tag]
            
            if textField.text?.isInt ?? false {
                bowler["tiebreaker"] = textField.text ?? "Error"
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
    
    @objc func setFinalScore(sender:UIButton!) {
    
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
    func retagButtonsInTableRows() {
        print("MANUAL ROW REMOVAL -- RETAGGING BUTTONS")
        for i in 0...self.tableView.numberOfRows(inSection: 0) {
            let myIndexPath = IndexPath(row: i, section: 0)
            let row = self.tableView.cellForRow(at: myIndexPath) as? TableRowViewController
            row?.nameButton.tag = i
            row?.frameButton.tag = i
            row?.tiebreakerButton.tag = i
            row?.fscoreButton.tag = i
        }
    }
    
    //MARK: Basic Application Functionality
    
    @IBAction func ShowTeamsAction(_ sender: Any) {
        
        var scoresOk = true
        var errorMessage = ""
        
        for bowler in bowlers {
            let frameIsInt = bowler["frame"]?.isInt ?? false
            let tiebreakerIsInt = bowler["tiebreaker"]?.isInt ?? false
            
            if frameIsInt {
                for otherBowler in bowlers {
                    let otherBowlerFrameIsInt = otherBowler["frame"]?.isInt ?? false
                    let otherBowlerTiebreakerIsInt = otherBowler["tiebreaker"]?.isInt ?? false
                    if otherBowlerFrameIsInt {
                        if bowler != otherBowler {
                            let bowlerFrame = Int(bowler["frame"]!)
                            let otherBowlerFrame = Int(otherBowler["frame"]!)
                            if bowlerFrame == otherBowlerFrame {
                                if !(tiebreakerIsInt && otherBowlerTiebreakerIsInt) {
                                    scoresOk = false
                                    errorMessage = "Found dupe scores with no tiebreakers"
                                }
                            }
                        }
                    }
                }
            } else {
                errorMessage = "Not all scores were recorded"
                scoresOk = false
            }
        }
        
        if errorMessage != "" {
            print(errorMessage)
        }
        
        if scoresOk {
            print("Showing Teams | \(bowlers.count) Bowlers")
            var bowlers_copy = bowlers
            var oddManOut:[String:String] = [:]
            if bowlers_copy.count%2 == 1 {
                print("Odd number of bowlers, finding low score ...")
                var lowGameID = 0
                var lowGame = 300
                for i in 0...bowlers_copy.count-1 {
                    let bowler = bowlers_copy[i]
                    let bowlerScore = bowler["frame"]
                    let bowlerScoreInt = Int(bowlerScore ?? "") ?? 0
                    
                    if bowlerScoreInt < lowGame {
                        lowGame = bowlerScoreInt
                        lowGameID = i
                    }
                }
                oddManOut = bowlers_copy.remove(at: lowGameID)
                print("Low man: \(oddManOut)")
                print("Other Bowlers: \(bowlers_copy.count)")
            } else {
                print("Even number of bowlers, we good to continue!")
            }
            
            var bowlers_order: [[String:String]] = []
            for bowler in bowlers_copy {
                if bowlers_order.count == 0 {
                    bowlers_order.append(bowler)
                } else {
                    for i in 0...bowlers_order.count-1 {
                        
                        let aBowler = bowlers_order[i]
                        
                        let bowlerA = Int(aBowler["frame"] ?? "") ?? 0
                        let bowlerB = Int(bowler["frame"] ?? "") ?? 0
                        
                        if bowlerB > bowlerA {
                            bowlers_order.insert(bowler, at: i)
                            break
                        } else if bowlerA == bowlerB {
                            let bowlerATiebreaker = Int(aBowler["tiebreaker"]!)
                            let bowlerBTiebreaker = Int(bowler["tiebreaker"]!)
                            
                            if bowlerBTiebreaker! > bowlerATiebreaker! {
                                bowlers_order.insert(bowler, at: i)
                                break
                            }
                        } else if i == bowlers_order.count-1 {
                            bowlers_order.insert(bowler, at: bowlers_order.endIndex)
                        }
                        
                    }
                }
            }
            
            
            var bowlers_teams: [[[String:String]]] = []
            
            while bowlers_order.count != 0 {
                print("Popping bowlers")
                let highBowler = bowlers_order.remove(at: 0)
                let lowBowler = bowlers_order.remove(at: bowlers_order.endIndex-1)
                let newTeam = [highBowler, lowBowler]
                bowlers_teams.append(newTeam)
            }
            
            for team in bowlers_teams {
                let highBowler = team[0]
                let lowBowler = team[1]
                
                let highScore = Int(highBowler["frame"] ?? "") ?? 0
                let lowScore = Int(lowBowler["frame"] ?? "") ?? 0
                print("NEW TEAM | \(highScore + lowScore)")
                print("Team Captain: \(highBowler["name"] ?? "err") | \(highBowler["frame"] ?? "err")")
                print("Low Man: \(lowBowler["name"] ?? "err") | \(lowBowler["frame"] ?? "err")")
            }
            
        }
        

        //TODO: Display a popover or something that shows all the teams, in order of team with high bowler first
    }
    @IBAction func ClearScoresAction(_ sender: Any) {
        for i in 0...bowlers.count-1 {
            var bowler = bowlers[i]
            bowler["frame"] = ""
            bowler["tiebreaker"] = ""
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
                self.bowlers.append(["name":textField.text ?? "Error", "frame":"---", "tiebreaker":"---", "fscore":"---"])
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
    
    
    
    
}
