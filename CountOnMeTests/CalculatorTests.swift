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
        XCTAssert( text == "2 + 2 = 4")

        text = calculator.subSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert( text == "4 - 2 = 2")

        text = calculator.mulSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert( text == "2 x 2 = 4")

        text = calculator.divSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert( text == "4 ÷ 2 = 2")
    }
    func testEqualSymbol_WithAnAddOfNumberWithAPreviousResult() {
        var text = "1 + 1 = 2"
        text = calculator.addNumber("2")
        text = calculator.addSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert(text == "2 + 2 = 4")
        text = calculator.addNumber("2")
        text = calculator.subSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert(text == "2 - 2 = 0")
        text = calculator.addNumber("2")
        text = calculator.mulSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert(text == "2 x 2 = 4")
        text = calculator.addNumber("2")
        text = calculator.divSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert(text == "2 ÷ 2 = 1")
    }
    
    func testDivSymbol_WithAnAddOfNumberWithAPreviousResult() {
        var text = "1 + 1 = 2"
        
        text = calculator.addNumber("2")
        text = calculator.divSymbol()
        text = calculator.addNumber("2")
        text = calculator.equalSymbol()
        XCTAssert(text == "2 ÷ 2 = 1")
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
