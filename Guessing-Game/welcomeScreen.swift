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
    
    var pickerData: [Int] = [Int]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseNumber.delegate = self
        chooseNumber.dataSource = self

        // Do any additional setup after loading the view.
        welcome.text = "Welcome to the Guessing Game!"
        chooseQuestion.text = "Please choose the number you want for your max value in your range in the game:"
        
        pickerData = Array(1...100).map { $0 * 10 }
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
