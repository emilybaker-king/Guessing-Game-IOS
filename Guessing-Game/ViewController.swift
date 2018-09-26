//
//  ViewController.swift
//  Guessing-Game
//
//  Created by Emily Baker-King on 9/21/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var attemptsLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var guessStatusLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var randomNumber: Int!
    var attempts = 5
    var maxNumber: Int!
    var attemptsMax: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        attempts = attemptsMax
        randomNumber = (Int(arc4random_uniform(UInt32(maxNumber)))+1)
        greetingLabel.text = "Pick a number between 1-\(maxNumber!)"
        attemptsLabel.text = "You have \(attempts) tries"
        guessStatusLabel.text = ""
    }

    @IBAction func resetClick(_ sender: Any) {
        greetingLabel.text = "Pick a number between 1-\(maxNumber!)"
        attempts = attemptsMax
        textField.isHidden = false
        submitButton.isHidden = false
        guessStatusLabel.text = ""
        randomNumber = (Int(arc4random_uniform(UInt32(maxNumber)))+1)
        attemptsLabel.text = "You have \(attempts) tries"
    }
    
    @IBAction func submitClick(_ sender: Any) {
        
        guard let guessedNumber = Int(textField.text!) else {
            return
        }
        
        if guessedNumber == randomNumber {
            greetingLabel.text = "You won!!!! 🎉"
            guessStatusLabel.text = "Do you want to play again?"
            textField.isHidden = true
            submitButton.isHidden = true
        } else if guessedNumber > maxNumber || guessedNumber < 1 {
            guessStatusLabel.text = "Please enter a valid number between 1-\(maxNumber!)"
        } else if guessedNumber > randomNumber {
            guessStatusLabel.text = "You guessed too high, pick a lower number."
            attempts -= 1
            attemptsLabel.text = "You have \(attempts) tries left."
            if attempts == 0 {
                greetingLabel.text = "You lost, better luck next time. The random number was \(randomNumber!)"
                guessStatusLabel.text = "Do you want to play again?"
                textField.isHidden = true
                submitButton.isHidden = true
            }
        } else if guessedNumber < randomNumber {
            guessStatusLabel.text = "You guessed too low, pick a higher number."
            attempts -= 1
            attemptsLabel.text = "You have \(attempts) tries left."
            if attempts == 0 {
                greetingLabel.text = "You lost, better luck next time. The random number was \(randomNumber!)"
                guessStatusLabel.text = "Do you want to play again?"
                textField.isHidden = true
                submitButton.isHidden = true
            }
        }
    }
    

}

