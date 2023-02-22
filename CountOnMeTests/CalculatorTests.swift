//
//  Calculator.swift
//  CountOnMeTests
//
//  Created by Quentin Dubut-Touroul on 07/02/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

final class CalculatorTests: XCTestCase {
    var calculator: Calculator!

    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    func testAddNumber () {
        XCTAssert(calculator.addNumber("2") == "2")
    }
    func testAddAddSymbol () {
        var text = calculator.addNumber("2")
        text = calculator.addSymbol()
        text = calculator.subSymbol()
        text = calculator.mulSymbol()
        text = calculator.divSymbol()
        XCTAssert(text == "2 + ")
    }
    func testAddSubSymbol () {
        var text = calculator.addNumber("2")
        text = calculator.subSymbol()
        text = calculator.addSymbol()
        text = calculator.mulSymbol()
        text = calculator.divSymbol()
        XCTAssert(text == "2 - ")
    }
    func testAddMulSymbol () {
        var text = calculator.addNumber("2")
        text = calculator.mulSymbol()
        text = calculator.addSymbol()
        text = calculator.subSymbol()
        text = calculator.divSymbol()
        XCTAssert(text == "2 x ")
    }
    func testAddDivSymbol () {
        var text = calculator.addNumber("2")
        text = calculator.divSymbol()
        text = calculator.addSymbol()
        text = calculator.subSymbol()
        text = calculator.mulSymbol()
        XCTAssert(text == "2 ÷ ")
    }
    func testResetSymbol () {
        var text = calculator.addNumber("2")
        text = calculator.addSymbol()
        text = calculator.addNumber("2")
        text = calculator.resetSymbol()
        XCTAssert( text == "")

        text = calculator.addNumber("2")
        text = calculator.subSymbol()
        text = calculator.addNumber("2")
        text = calculator.resetSymbol()
        XCTAssert( text == "")

        text = calculator.addNumber("2")
        text = calculator.mulSymbol()
        text = calculator.addNumber("2")
        text = calculator.resetSymbol()
        XCTAssert( text == "")

        text = calculator.addNumber("2")
        text = calculator.divSymbol()
        text = calculator.addNumber("2")
        text = calculator.resetSymbol()
        XCTAssert( text == "")
    }
    func testEqualSymbol_WithAnAddOfSymbolWithAPreviousResult () {
        var text = ""
        text = calculator.addNumber("2")
        text = calculator.addSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert( text == "2 + 2 = 4.0")

        text = calculator.subSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert( text == "4.0 - 2 = 2.0")

        text = calculator.mulSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert( text == "2.0 x 2 = 4.0")

        text = calculator.divSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert( text == "4.0 ÷ 2 = 2.0")
    }
    func testEqualSymbol_WithAnAddOfNumberWithAPreviousResult() {
        var text = ""
        text = calculator.addNumber("2")
        text = calculator.addSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert(text == "2 + 2 = 4.0")
        text = calculator.addNumber("2")
        text = calculator.subSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert(text == "2 - 2 = 0.0")
        text = calculator.addNumber("2")
        text = calculator.mulSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert(text == "2 x 2 = 4.0")
        text = calculator.addNumber("2")
        text = calculator.divSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert(text == "2 ÷ 2 = 1.0")
    }
    func testDivSymbol_WithAnAddOfNumberWithAPreviousResult() {
        var text = ""
        text = calculator.addNumber("2")
        text = calculator.divSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert(text == "2 ÷ 2 = 1.0")
    }
    func testDivSymbol() {
        var text = ""
        text = calculator.addNumber("1")
        text = calculator.divSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert(text == "1 ÷ 2 = 0.5")
    }
    func testDifficultComputation() {
        var text = ""
        text = calculator.addNumber("1")
        text = calculator.divSymbol()
        text = calculator.addNumber("2")
        text = calculator.addSymbol()
        text = calculator.addNumber("3")
        text = calculator.subSymbol()
        text = calculator.addNumber("2")
        text = calculator.mulSymbol()
        text = calculator.addNumber("5")
        text = calculator.addSymbol()
        text = calculator.addNumber("1")
        text = calculator.equalSymbol()
        XCTAssert(text == "1 ÷ 2 + 3 - 2 x 5 + 1 = -5.5")
    }
    func testFalseExpression() {
        var text = ""
        text = calculator.addNumber("1")
        text = calculator.divSymbol()

        text = calculator.equalSymbol()
        XCTAssert(text == "1 ÷ ")
    }
    func testNotEnoughtElement() {
        var text = ""
        text = calculator.addNumber("1")

        text = calculator.equalSymbol()
        XCTAssert(text == "1")
    }

    func testDivideByZero() {
        var text = ""
        text = calculator.addNumber("1")
        text = calculator.divSymbol()
        text = calculator.addNumber("0")
        text = calculator.equalSymbol()
        XCTAssert(text == "Non divisible par 0")
    }
    func testAddNumberAfterZeroError() {
        var text = ""
        text = calculator.addNumber("2")
        XCTAssert(text == "2")
    }
    func testAddSymbolAfterZeroError() {
        var text = ""
        text = calculator.addSymbol()
        XCTAssert(text == "")
    }
    func testAddSymbolSubAfterZeroError() {
        var text = ""
        text = calculator.subSymbol()
        XCTAssert(text == " - ")
    }
    func testAddSymbolMulAfterZeroError() {
        var text = "Non divisible par 0"
        text = calculator.mulSymbol()
        XCTAssert(text == "")
    }
    func testAddSymbolDivAfterZeroError() {
        var text = "Non divisible par 0"
        text = calculator.divSymbol()
        XCTAssert(text == "")
    }
    func testFirstNumberNegative() {
        var text = ""
        text = calculator.subSymbol()
        text = calculator.addNumber("1")
        text = calculator.addSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert(text == " - 1 + 2 = 1.0")
    }
    func testAddNumberAfterDivisionByZero() {
        var text = ""
        text = calculator.addNumber("1")
        text = calculator.divSymbol()
        text = calculator.addNumber("0")
        text = calculator.equalSymbol()
        text = calculator.addNumber("1")
        XCTAssert(text == "1")
    }
    func testAddSubSymbolAfterDivisionByZero() {
        var text = ""
        text = calculator.addNumber("1")
        text = calculator.divSymbol()
        text = calculator.addNumber("0")
        text = calculator.equalSymbol()
        text = calculator.subSymbol()
        XCTAssert(text == " - ")
    }
    func testAddSymbolInCumputeLeftAndNotNumber() {
        var text = ""
        text = calculator.addNumber("a")
        text = calculator.addSymbol()
        text = calculator.addNumber("1")
        text = calculator.equalSymbol()
        XCTAssert(text == "a + 1 = 0.0")
    }
    func testAddSymbolInCumputeRightAndNotNumber() {
        var text = ""
        text = calculator.addNumber("1")
        text = calculator.addSymbol()
        text = calculator.addNumber("b")
        text = calculator.equalSymbol()
        XCTAssert(text == "1 + b = 0.0")
    }
    func testAddNumberGuard() {
        var text = ""
        text = calculator.addNumber(nil)
        XCTAssert(text == "")
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code
        // to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
