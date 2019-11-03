//
//  ViewController.swift
//  auto layout calculator
//
//  Created by Alex Reckard on 8/31/19.
//  Copyright © 2019 Alex Reckard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // secure
    private var isFinishedTyping : Bool = true;
    
    private var displayValue : Double {
        
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Text to Double conversion unsuccessful.")
            };
            return number
        }
        set {
            displayLabel.text! = String(newValue)
        }
    };
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    };
    
    // add private access to all global variables by default
    private var calculator = CalculatorLogic();
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTyping = true;
        
        calculator.setNum(displayValue);
        
        if let calcMethod = sender.currentTitle {
                        
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result;
            };
        };
    };
    
  
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numVal = sender.currentTitle {
            
            if isFinishedTyping {
                displayLabel.text = numVal;
                isFinishedTyping = false;
            } else {
                
                // this will help stop from being able to add more than one decimal period
                if numVal == "." {
                                    
                    // round down display val
                    let isInt = floor(displayValue) == displayValue;
                
                    if !isInt {
                        return
                    };
                };
                displayLabel.text = displayLabel.text! + numVal;
            };
        };
    };
};

