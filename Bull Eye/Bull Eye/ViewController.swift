//
//  ViewController.swift
//  Bull Eye
//
//  Created by Mahmoud Hosny on 4/12/17.
//  Copyright © 2017 SoftwareOfficers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var MyGameSlider: UISlider!
    @IBOutlet var MyGameTargetValueLabel: UILabel!
    @IBOutlet var MyGameRoundCounterLabel: UILabel!
    @IBOutlet var MyGameScoreLabel: UILabel!
    
    var sliderCurrentValue : Int?
    var userTargetValue : Int?
    var roundCounter : Int = 0
    var currentScore : Int = 0
    var message : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(_ sender: UIButton) {
        calculateScore(targetValue: userTargetValue!, selectedValue: sliderCurrentValue!, calculatedScore: &currentScore)
        
        let alert = UIAlertController(title: "Hello", message: message! + "The value of the slider is \(sliderCurrentValue!) your target value is \(userTargetValue!)", preferredStyle: .actionSheet)
        
        let action = UIAlertAction(title: "awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        updateCurrentGame()
        updateGameScene()
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        sliderCurrentValue = lroundf(sender.value)
    }
    
    func calculateScore(targetValue: Int, selectedValue: Int, calculatedScore: inout Int){
        
        switch abs(selectedValue - targetValue){
        case 0:
            currentScore += 100
            message = "perfect!"
        case 1...5:
            currentScore += 50
            message = "You almost had it!"
        case 6...10:
            message = "Pretty good!"
        default:
            message = "Not even close..."
        }
        
    }
    
    @IBAction func startOverNewGame(_ sender: UIButton) {
        startNewGame()
    }
    func updateGameScene(){
        MyGameScoreLabel.text = String(currentScore)
        MyGameRoundCounterLabel.text = String(roundCounter)
        MyGameTargetValueLabel.text = String(userTargetValue!)
        MyGameSlider.value = Float(sliderCurrentValue!)
    }
    
    func updateCurrentGame(){
        userTargetValue = 1 + Int(arc4random_uniform(100))
        sliderCurrentValue = 50
        roundCounter += 1
    }
    
    func startNewGame(){
        roundCounter = 0
        currentScore = 0
        updateCurrentGame()
        updateGameScene()
    }

}

