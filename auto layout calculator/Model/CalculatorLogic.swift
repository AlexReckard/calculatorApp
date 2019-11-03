//
//  CalculatorLogic.swift
//  auto layout calculator
//
//  Created by Alex Reckard on 10/24/19.
//  Copyright © 2019 Alex Reckard. All rights reserved.
//

import Foundation

// no inheritance using structs
// stores data differently than a class such as Stack - FILO data structure
// Value vs Referencing - Structs are Value Types and Classes are Reference Types
struct CalculatorLogic {
    
    // always have private access so it doesnt get altered intentionally or unintentionally
    private var number : Double?;
    
    private var intermediateCalc : (n1 : Double, calcMethod : String)?
    
    // _ means that the external name to be nothing and the internal to number
    // self.global number
    mutating func setNum(_ number: Double) {
        self.number = number
    };
    
    mutating func calculate(symbol: String) -> Double? {
       
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1;
            case "%":
                return n / 100;
            case "AC":
                return 0;
            case "=":
                return performTwoNumCalc(n2: n);
            default:
                intermediateCalc = (n1: n, calcMethod: symbol);
            };
        };
        
        return nil;
    
    };
    
    private func performTwoNumCalc(n2: Double) -> Double? {
        
        if let n1 = intermediateCalc?.n1,
            let operation = intermediateCalc?.calcMethod {
            
            switch operation {
            case "x":
                return n1 * n2;
            case "÷":
                return n1 / n2;
            case "+":
                return n1 + n2;
            case "-":
                return n1 - n2;
            default:
                fatalError("The operation does not match the listed cases");
            };
        };
        
        return nil;
        
    };
};
