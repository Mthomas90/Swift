//
//  DiscountRateTests.swift
//  CashRegisterApplicationTests
//
//  Copyright © 2019 007. All rights reserved.
//

import XCTest

@testable import CashRegisterApplication
class DiscountRateTests: XCTestCase {
    
    //Testing if I get the correct response from the getDiscountRate method
    func testDiscountRate() {
        let test1 = DiscountRate.getDiscountRate(total: 555)
        XCTAssertEqual(0.0, test1)
        let test2 = DiscountRate.getDiscountRate(total: 1500)
        XCTAssertEqual(3.0, test2)
        let test3 = DiscountRate.getDiscountRate(total: 5555)
        XCTAssertEqual(5.0, test3)
        let test4 = DiscountRate.getDiscountRate(total: 9000)
        XCTAssertEqual(7.0, test4)
        let test5 = DiscountRate.getDiscountRate(total: 25000)
        XCTAssertEqual(10.0, test5)
        let test6 = DiscountRate.getDiscountRate(total: 70000)
        XCTAssertEqual(15.0, test6)
    }



}
