//
//  ViewController.swift
//  Calculator
//
//  Created by Neil Cai on 8/27/16.
//  Copyright © 2016 Neil,Cai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    
    @IBAction private func touchDigit (sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyDisplay = display.text
            display.text = textCurrentlyDisplay! + digit
        }else{
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double{
        get{
            return Double(display.text!)!
        }set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain ()
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOPerand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicaSymbol = sender.currentTitle{
            brain.performOperation(mathematicaSymbol)
        }
        displayValue = brain.result
    }
    
}

