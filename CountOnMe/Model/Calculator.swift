//
//  Calculator.swift
//  CountOnMe
//
//  Created by Quentin Dubut-Touroul on 01/02/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    private var text: String = ""
    private var lastResult: String = ""
    private var elements: [String] {
        return text.split(separator: " ").map { "\($0)" }
    }
    // Error check computed variables
    private var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷"
    }
    private var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    private var canAddOperator: Bool {
        if lastResult != "" {
            text = lastResult
        }
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷"
    }
    private var expressionHaveResult: Bool {
        return text.firstIndex(of: "=") != nil
    }
    // Add Number for the calculator
    public func addNumber(_ number: String?) -> String {
        guard let numberText = number else {
            return text
        }
        if expressionHaveResult {
            lastResult = ""
            text = ""
        }
        text += numberText
        return text
    }
    // Add Operator for the calculator
    public func addSymbol() -> String {
        if canAddOperator {
            text += " + "
            return text
        }
        return text
    }

    public func subSymbol() -> String {
        if canAddOperator {
            text += " - "
            return text
        }
        return text
    }
    public func mulSymbol() -> String {
        if canAddOperator {
            text += " x "
            return text
        }
        return text
    }
    public func divSymbol() -> String {
        if canAddOperator {
            text += " ÷ "
            return text
        }
        return text
    }

    public func resetSymbol() -> String {
        text = ""
        lastResult = ""
        return text
    }

    public func equalSymbol() -> String {
        guard expressionIsCorrect else {
            return text
        }
        guard expressionHaveEnoughElement else {
            return text
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
            case "+":
                result = left + right
            case "-":
                result = left - right
            case "x":
                result = left * right
            case "÷":
                result = left / right
            default:
                return text
            }
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
            lastResult = "\(result)"
        }
        text += " = \(operationsToReduce.first!)"
        return text
    }

}
