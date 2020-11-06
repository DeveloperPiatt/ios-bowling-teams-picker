//
//  ShowTeamsViewController.swift
//  BowlingTeamPicker
//
//  Created by Nick Piatt on 11/5/20.
//  Copyright © 2020 Nick Piatt. All rights reserved.
//

import UIKit

class ShowTeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var teams: [[[String:String]]] = []
    var scoresPosted = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let team = teams[indexPath.row]
        let bowlerA = team[0]
        let bowlerB = team[1]
        
        let bowlerAName = bowlerA["name"]!
        let bowlerBName = bowlerB["name"]!
        
        var bowlerAScore = 0
        var bowlerBScore = 0
        
        if scoresPosted {
            bowlerAScore = Int(bowlerA["fscore"]!)!
            bowlerBScore = Int(bowlerB["fscore"]!)!
        } else {
            bowlerAScore = Int(bowlerA["frame"]!)!
            bowlerBScore = Int(bowlerB["frame"]!)!
        }
        
        
        
        
        let teamName = "\(bowlerAName) & \(bowlerBName)"
        let teamScore = "=> \(bowlerAScore + bowlerBScore)"

        cell.detailTextLabel?.text = teamScore
        cell.textLabel?.text = teamName
        
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkForScores()
        tableView.reloadData()
    }
    
    func checkForScores() {
        scoresPosted = true
        for team in teams {
            let bowlerA = team[0]
            let bowlerB = team[1]
            
            let bowlerAHasScorePosted = bowlerA["fscore"]?.isInt ?? false
            let bowlerBHasScorePosted = bowlerB["fscore"]?.isInt ?? false
            
            if !(bowlerAHasScorePosted && bowlerBHasScorePosted) {
                scoresPosted = false
            }
        }
        print("Scores All Posted: \(scoresPosted)")
    }
    
}

