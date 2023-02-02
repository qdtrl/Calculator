//
//  Calculator.swift
//  CountOnMe
//
//  Created by Quentin Dubut-Touroul on 01/02/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    var text:String = ""
    
    var elements: [String] {
        return text.split(separator: " ").map { "\($0)" }
    }
    
    // Error check computed variables
    
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-"
    }
    
    var expressionHaveResult: Bool {
        return text.firstIndex(of: "=") != nil
    }
    
    
    // View actions
   
    func addNumber(_ number:String?) -> String {
        guard let numberText = number else {
            return ""
        }
        
        if expressionHaveResult {
            return ""
        }
        
        return numberText
    }
    
    func addSymbol() -> String {
        if canAddOperator {
            text += " + "
            return text
        }
        return text
//        else {
//            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
//            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.present(alertVC, animated: true, completion: nil)
//        }
    }

    func subSymbol() -> String {
        if canAddOperator {
            text += " - "
            return text
        }
        return text

//        else {
//            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
//            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.present(alertVC, animated: true, completion: nil)
//        }
    }
    
    func mulSymbol() -> String {
        if canAddOperator {
            text += " x "
            return text
        }
        return text

//        else {
//            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
//            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.present(alertVC, animated: true, completion: nil)
//        }
    }
    
    func divSymbol() -> String {
        if canAddOperator {
            text += " ÷ "
            return text
        }
        return text

//        else {
//            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
//            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.present(alertVC, animated: true, completion: nil)
//        }
    }

    func resetSymbol() -> String {
        if canAddOperator {
            text = ""
            return text
        }
        return text

//        else {
//            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
//            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.present(alertVC, animated: true, completion: nil)
//        }
    }

    func equalSymbol() -> String{
        guard expressionIsCorrect else {
//            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
//            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            return self.present(alertVC, animated: true, completion: nil)
            return ""
        }
        
        guard expressionHaveEnoughElement else {
//            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
//            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            return self.present(alertVC, animated: true, completion: nil)
            return ""
        }
        
        // Create local copy of operations
        var operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!
            
            let result: Int
            switch operand {
                case "+": result = left + right
                case "-": result = left - right
                case "x": result = left * right
                case "÷": result = left / right
                default: fatalError("Unknown operator !")
            }
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        text += " = \(operationsToReduce.first!)"
        return text
    }

}
