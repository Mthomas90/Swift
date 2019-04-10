//
//  CalculatorTest.swift
//  CashRegisterApplicationTests
//
//  Copyright © 2019 007. All rights reserved.
//

import XCTest

@testable import CashRegisterApplication
class CalculatorTest: XCTestCase {
    
    //Tests the total price method
    func testTotalPrice() {
        XCTAssertEqual(Calculator.calculateTotalPrice(10, 40), 400)
        XCTAssertEqual(Calculator.calculateTotalPrice(20, 50), 1000)
        XCTAssertEqual(Calculator.calculateTotalPrice(70, 900), 63000)
        XCTAssertEqual(Calculator.calculateTotalPrice(35, 700), 24500)
    }
    
    //Tests the calculate tax method
    func testCalculateTax() {
        let test1 = Calculator.calculateTax(stateCode: "UT", totalPrice: 1000)
        XCTAssertEqual(test1.0, 6.85)
        XCTAssertEqual(test1.1, 68.5)
        
        let test2 = Calculator.calculateTax(stateCode: "TX", totalPrice: 2000)
        XCTAssertEqual(test2.0, 6.25)
        XCTAssertEqual(test2.1, 125)
        
        let test3 = Calculator.calculateTax(stateCode: "CA", totalPrice: 4000)
        XCTAssertEqual(test3.0, 8.25)
        XCTAssertEqual(test3.1, 330)
    }

    //Tests the calculate discount method
    func testDiscountTax() {
        let test1 = Calculator.calculateDiscount(totalPrice: 10000)
        XCTAssertEqual(test1.0, 10.0)
        XCTAssertEqual(test1.1, 1000)
        
        let test2 = Calculator.calculateDiscount(totalPrice: 75000)
        XCTAssertEqual(test2.0, 15.0)
        XCTAssertEqual(test2.1, 11250)
        
        let test3 = Calculator.calculateDiscount(totalPrice: 2000)
        XCTAssertEqual(test3.0, 3.0)
        XCTAssertEqual(test3.1, 60)
    }

}
