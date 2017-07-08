//
//  ViewController.swift
//  Calc
//
//  Created by Евгений on 27.06.17.
//  Copyright © 2017 Евгений. All rights reserved.
//

import UIKit
import Darwin


class ViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel!
    
    var DisplayValue: Double
        
        {
        
        get
        {
            return Double(display.text!)!
           // print("Hello")
        }
        
        set {  display.text = String(newValue)}
    
    
    
    }
    
    var userIsInTheMiddleOfTyping = false
    
    

    
    @IBAction func TouchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if(userIsInTheMiddleOfTyping)
            
        {
            if(digit==".")
            {
            sender.isEnabled = false
            
            }
            
            display.text! = display.text! + digit
            
        }
            
        else
        { display.text! = digit
            userIsInTheMiddleOfTyping = true
        }
        
        
    }
    
    private var brain  = Brain()
    
    @IBAction func sqrt(_ sender: UIButton) {
        
      
        
         if (userIsInTheMiddleOfTyping)
        
         {
            brain.setOperand(DisplayValue)
        
        userIsInTheMiddleOfTyping = false
        }
        
        
        if let mathsymb = sender.currentTitle
        
        { brain.performOperation(mathsymb)}
        
        if let result = brain.result
        {
        
        DisplayValue = result
        }
        
        
        
    
        
    }
}

