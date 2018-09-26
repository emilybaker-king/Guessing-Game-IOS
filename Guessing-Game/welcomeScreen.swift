//
//  welcomeScreen.swift
//  Guessing-Game
//
//  Created by Emily Baker-King on 9/25/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import UIKit

class welcomeScreen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var chooseQuestion: UILabel!
    @IBOutlet weak var chooseNumber: UIPickerView!
    @IBOutlet weak var advanceButton: UIButton!
    @IBOutlet weak var triesLabel: UILabel!
    @IBOutlet weak var attempts: UISegmentedControl!
    @IBOutlet weak var darkMode: UILabel!
    @IBOutlet weak var onOff: UISwitch!
    
    var pickerData: [Int] = [Int]()
    
    var playAttempts: Int = 5

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseNumber.delegate = self
        chooseNumber.dataSource = self

        // Do any additional setup after loading the view.
        welcome.text = "Welcome to the Guessing Game!"
        chooseQuestion.text = "Please choose the number you want for your max value in your range in the game:"
        triesLabel.text = "Choose how many tries you want to have to guess the number:"
        darkMode.text = "Dark mode"
    
        
        pickerData = Array(1...100).map { $0 * 10 }
        
    }
    
    @IBAction func switchColor(_ sender: Any) {
        
        if onOff.isOn {
            self.view.backgroundColor = UIColor.white
        } else {
            self.view.backgroundColor = UIColor.black
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(pickerData[row])"
    }

    @IBAction func attemptsSelector(_ sender: Any) {
        if attempts.selectedSegmentIndex == 0 {
            playAttempts = 5
        } else if attempts.selectedSegmentIndex == 1 {
            playAttempts = 10
        } else if attempts.selectedSegmentIndex == 2 {
            playAttempts = 15
        } else if attempts.selectedSegmentIndex == 3 {
            playAttempts = 20
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? ViewController {
            let number = pickerData[chooseNumber.selectedRow(inComponent: 0)]
            destination.maxNumber = number
            
            destination.attemptsMax = playAttempts
            
            destination.darkModeOn = onOff.isOn
        }
        
    }
}
