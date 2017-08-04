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
        let tipString = String(format: "%g", tipPercentage*100)
        tipPercentageLabel.text = tipString + "%"
        billField.delegate = self
        billField.becomeFirstResponder()
        
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

