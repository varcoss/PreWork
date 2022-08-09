//
//  ViewController.swift
//  Prework
//
//  Created by Dario S on 8/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    var tipPercentages = [0.15, 0.18, 0.20]
    var negativeCounter = 0

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var increaseLabel: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //billAmountTextField.becomeFirstResponder()
    }
    
    
    @IBAction func increasePercentage(_ sender: UIStepper) {
        var displayThis = 0
        //var cannotDisplay = false
        
        if(sender.value == 2){
            if(tipControl.selectedSegmentIndex == 0)
            {
                tipPercentages[0] = tipPercentages[0] + 0.01
                displayThis = Int(round(tipPercentages[0] * 100))
                let stringValue = (String(describing: displayThis)) + "%"
                tipControl.setTitle(stringValue, forSegmentAt: tipControl.selectedSegmentIndex)
                calcAndDisplayTotal()
                negativeCounter = negativeCounter + 1
            }else if(tipControl.selectedSegmentIndex == 1)
            {
                tipPercentages[1] = tipPercentages[1] + 0.01
                displayThis = Int(round(tipPercentages[1] * 100))
                let stringValue = (String(describing: displayThis)) + "%"
                tipControl.setTitle(stringValue, forSegmentAt: tipControl.selectedSegmentIndex)
                calcAndDisplayTotal()
                negativeCounter = negativeCounter + 1
            }else if(tipControl.selectedSegmentIndex == 2)
            {
                tipPercentages[2] = tipPercentages[2] + 0.01
                displayThis = Int(round(tipPercentages[2] * 100))
                let stringValue = (String(describing: displayThis)) + "%"
                tipControl.setTitle(stringValue, forSegmentAt: tipControl.selectedSegmentIndex)
                calcAndDisplayTotal()
                negativeCounter = negativeCounter + 1
            }
        }else{
            if(tipControl.selectedSegmentIndex == 0 && negativeCounter > -14)
            {
                tipPercentages[0] = tipPercentages[0] - 0.01
                displayThis = Int(round(tipPercentages[0] * 100))
                let stringValue = (String(describing: displayThis)) + "%"
                tipControl.setTitle(stringValue, forSegmentAt: tipControl.selectedSegmentIndex)
                calcAndDisplayTotal()
                negativeCounter = negativeCounter - 1
            }else if(tipControl.selectedSegmentIndex == 1 && negativeCounter > -17)
            {
                tipPercentages[1] = tipPercentages[1] - 0.01
                displayThis = Int(round(tipPercentages[1] * 100))
                let stringValue = (String(describing: displayThis)) + "%"
                tipControl.setTitle(stringValue, forSegmentAt: tipControl.selectedSegmentIndex)
                calcAndDisplayTotal()
                negativeCounter = negativeCounter - 1
            }else if(tipControl.selectedSegmentIndex == 2 && negativeCounter > -18)
            {
                tipPercentages[2] = tipPercentages[2] - 0.01
                displayThis = Int(round(tipPercentages[2] * 100))
                let stringValue = (String(describing: displayThis)) + "%"
                tipControl.setTitle(stringValue, forSegmentAt: tipControl.selectedSegmentIndex)
                calcAndDisplayTotal()
                negativeCounter = negativeCounter - 1
            }
        }
        sender.value = 1;
        
    }
    
    @IBAction func calculateTip(_ sender: Any)
    {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f",total)
    }
    
    func calcAndDisplayTotal()
    {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f",total)
    }

}


