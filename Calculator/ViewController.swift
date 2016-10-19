//
//  ViewController.swift
//  Calculator
//
//  Created by Andrew Wang on 9/19/16.
//  Copyright © 2016 Andrew Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    var userIsTyping = false
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsTyping = true
        
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }

    private var brain = CalculatorBrain()
    @IBAction func performOperation(sender: UIButton) {
        if userIsTyping {
            brain.setOperand(displayValue)
            userIsTyping = false
        }
       
        if let mathSymbol = sender.currentTitle {
            brain.performOperation(mathSymbol)
        }
        displayValue = brain.result
        
    }
}

