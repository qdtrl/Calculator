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
    private var firstNumberNegative: Bool = false
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
    private func textResetAfterDivZero() {
        if text == "Non divisible par 0" {
            text = ""
        }
    }
    private var canAddOperator: Bool {
        if lastResult != "" {
            text = lastResult
        }
        if text == "" {
            return false
        }
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷"
    }
    private var expressionHaveResult: Bool {
        return text.firstIndex(of: "=") != nil
    }
    // Add Number for the calculator
    public func addNumber(_ number: String?) -> String {
        textResetAfterDivZero()
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
        textResetAfterDivZero()
        if canAddOperator {
            text += " + "
        }
        return text
    }

    public func subSymbol() -> String {
        if lastResult != "" {
            text = lastResult
        }
        if text == "Non divisible par 0" {
            text = ""
        }
        if elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷" {
            text += " - "
        }
        return text
    }
    public func mulSymbol() -> String {
        textResetAfterDivZero()
        if canAddOperator {
            text += " x "
        }
        return text
    }
    public func divSymbol() -> String {
        textResetAfterDivZero()
        if canAddOperator {
            text += " ÷ "
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
        if operationsToReduce.first == "-" {
            firstNumberNegative = true
            operationsToReduce.remove(at: 0)
        }
        // Iterate over operations while an mul or div operand still here
        while operationsToReduce.contains("x") || operationsToReduce.contains("÷") {
            let index = operationsToReduce.firstIndex(where: {$0 == "x" || $0 == "÷"})!
            if operationsToReduce[index] == "÷" && operationsToReduce[index + 1] == "0" {
                text = "Non divisible par 0"
                lastResult = ""
                return text
            }
            let result = compute(
                operationsToReduce[index - 1],
                operationsToReduce[index],
                operationsToReduce[index + 1])
            operationsToReduce[index] = "\(result)"
            lastResult = "\(result)"
            operationsToReduce.remove(at: index + 1)
            operationsToReduce.remove(at: index - 1)
        }
        // Iterate over operations while an add or sub operand still here
        while operationsToReduce.count > 1 {
            let result = compute(operationsToReduce[0], operationsToReduce[1], operationsToReduce[2])
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
            lastResult = "\(result)"
        }
        text += " = \(operationsToReduce.first!)"
        return text
    }
    private func compute(_ left: String, _ operand: String, _ right: String) -> Double {
        guard var left = Double(left) else { return Double() }
        guard let right = Double(right) else { return Double() }
        // Check if the first calculation is negative and multiply by -1
        if firstNumberNegative {
            left *= -1.0
            firstNumberNegative = false
        }

        switch operand {
        case "+":
            return left + right
        case "-":
            return left - right
        case "x":
            return left * right
        case "÷":
            return left / right
        default:
            return Double()
        }
    }

}
