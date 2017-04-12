//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Mahmoud Hosny on 4/8/17.
//  Copyright © 2017 SoftwareOfficers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue : Int?
    var tValue : Int? // target value
    @IBOutlet weak var MySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // interface builder action
    @IBAction func showAlert(){
        let alert = UIAlertController(title: "Hello", message: "The value of the slider is \(currentValue!) your target value is \(tValue!)", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    @IBAction func sliderMoved(_ slider: UISlider){
        print("the value of the slide is now \(slider.value)")
        currentValue = lroundf(slider.value)
        
    }
    
    func startNewRound(){
        tValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        MySlider.value = Float(currentValue!)
    }

}

