//
//  ViewController.swift
//  Guessing-Game
//
//  Created by Emily Baker-King on 9/21/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var attemps: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var guessStatusLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        greetingLabel.text = "Pick a number between 1-100"
    }

    @IBAction func resetClick(_ sender: Any) {
        
    }
    
    @IBAction func submitClick(_ sender: Any) {
        
    }
    

}

