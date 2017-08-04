//
//  SettingsViewController.swift
//  Tiply
//
//  Created by Luther Banner III on 8/2/17.
//  Copyright © 2017 Luther Banner III. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentageLabel: UILabel!
    var tipPercentage:Double = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        tipPercentage = (defaults.object(forKey: "Default Tip") as! Double?) ?? 0.18
        
        let tipString = String(format: "%g", tipPercentage*100)
        tipPercentageLabel.text = tipString + "%"
        
        // Do any additional setup after loading the view.
    }
    @IBAction func increasePercentage(_ sender: Any) {
        if tipPercentage < 1{
            tipPercentage+=0.01
            let tipString = String(format: "%g", tipPercentage*100)
            tipPercentageLabel.text = tipString + "%"
            changeDefaultTip(sender)
        }
    }
    @IBAction func decreasePercentage(_ sender: Any) {
        if tipPercentage > 0.15{
            tipPercentage-=0.01
            let tipString = String(format: "%g", tipPercentage*100)
            tipPercentageLabel.text = tipString + "%"
            changeDefaultTip(sender)
        }
    }
    func changeDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tipPercentage, forKey: "Default Tip")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
