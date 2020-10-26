//
//  ViewController.swift
//  BowlingTeamPicker
//
//  Created by Nick Piatt on 10/22/20.
//  Copyright © 2020 Nick Piatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var defaultPlayerValue: Double = 6
    
    @IBOutlet weak var numOfPlayersLabel: UILabel!
    @IBOutlet weak var numOfPlayersStepper: UIStepper!
    
    
    @IBAction func numOfPlayersStepperChanged(_ sender: Any) {
        numOfPlayersLabel.text = String(Int(numOfPlayersStepper.value))
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        numOfPlayersStepper.value = defaultPlayerValue
        numOfPlayersLabel.text = String(Int(numOfPlayersStepper.value))
    }


}

