//
//  ViewController.swift
//  Calculator
//
//  Created by Andrew Wang on 9/19/16.
//  Copyright © 2016 Andrew Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsTyping = false
    
    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsTyping = true
        
    }

    @IBAction func performOperation(sender: UIButton) {
        userIsTyping = false
        if let mathSymbol = sender.currentTitle {
            if mathSymbol == "π" {
                display.text = String(M_PI)
            }
        }
        
    }
}

