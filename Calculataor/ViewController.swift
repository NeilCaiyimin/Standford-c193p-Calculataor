//
//  ViewController.swift
//  Calculator
//
//  Created by Neil Cai on 8/27/16.
//  Copyright © 2016 Neil,Cai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    
    @IBAction func touchDigit (sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyDisplay = display.text
            display.text = textCurrentlyDisplay! + digit
        }else{
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    var displayValue: Double{
        get{
            return Double(display.text!)!
        }set{
            display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicaSymbol = sender.currentTitle{
            if mathematicaSymbol == "π" {
                displayValue = M_PI
                //display.text = String(M_PI)
            }else if mathematicaSymbol == "√"{
                displayValue = sqrt(displayValue)
            }
        }
    }
}

