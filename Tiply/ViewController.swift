//
//  ViewController.swift
//  Tiply
//
//  Created by Luther Banner III on 8/2/17.
//  Copyright © 2017 Luther Banner III. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    
    var tipPercentage:Double = 0.2
    var numSplit:Int = 1
    
    @IBAction func exitSettings(segue: UIStoryboardSegue) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        billField.delegate = self
        billField.becomeFirstResponder()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        tipPercentage = (defaults.object(forKey: "Default Tip") as! Double?) ?? 0.18
        if (defaults.object(forKey: "Stored Bill Amount") != nil) {
            let lastTime = defaults.object(forKey: "Stored Bill Time") as! NSDate
            if NSDate().timeIntervalSince(lastTime as Date) < 600 {
                billField.text = defaults.object(forKey: "Stored Bill Amount") as! String?
                calculateTip(billField)
            }
            else {
                defaults.removeObject(forKey: "Stored Bill Amount")
                defaults.removeObject(forKey: "Stored Bill Time")
            }
        }
        let tipString = String(format: "%g", tipPercentage*100)
        tipPercentageLabel.text = tipString + "%"
        calculateTip(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        let tip = (bill*tipPercentage)/Double(numSplit)
        let total = (bill + tip)/Double(numSplit)
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let defaults = UserDefaults.standard
        defaults.set(billField.text, forKey: "Stored Bill Amount")
        defaults.set(NSDate.init(), forKey: "Stored Bill Time")
        defaults.synchronize()
    }
    
    @IBAction func increasePercentage(_ sender: Any) {
        if tipPercentage < 1{
            tipPercentage+=0.01
            let tipString = String(format: "%g", tipPercentage*100)
            tipPercentageLabel.text = tipString + "%"
            calculateTip(sender)
        }
    }
    @IBAction func decreasePercentage(_ sender: Any) {
        if tipPercentage > 0.15{
            tipPercentage-=0.01
            let tipString = String(format: "%g", tipPercentage*100)
            tipPercentageLabel.text = tipString + "%"
            calculateTip(sender)
        }
    }
    @IBAction func increaseSplit(_ sender: Any) {
        if numSplit < 5{
            numSplit+=1
            splitLabel.text = String(numSplit)
            calculateTip(sender)
        }
    }
    @IBAction func decreaseSplit(_ sender: Any) {
        if numSplit > 1{
            numSplit-=1
            splitLabel.text = String(numSplit)
            calculateTip(sender)
        }
    }
    
    

}

