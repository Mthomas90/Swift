//
//  DiscountRateTests.swift
//  CashRegisterApplicationTests
//
//  Created by 007 on 28/03/2019.
//  Copyright © 2019 007. All rights reserved.
//

import XCTest

@testable import CashRegisterApplication
class DiscountRateTests: XCTestCase {
    
    //Testing if I get the correct response from the getDiscountRate method
    func testDiscountRate() {
        let t1 = DiscountRate.getDiscountRate(total: 555)
        XCTAssertEqual(0.0, t1)
        let t2 = DiscountRate.getDiscountRate(total: 1500)
        XCTAssertEqual(3.0, t2)
        let t3 = DiscountRate.getDiscountRate(total: 5555)
        XCTAssertEqual(5.0, t3)
        let t4 = DiscountRate.getDiscountRate(total: 9000)
        XCTAssertEqual(7.0, t4)
        let t5 = DiscountRate.getDiscountRate(total: 25000)
        XCTAssertEqual(10.0, t5)
        let t6 = DiscountRate.getDiscountRate(total: 70000)
        XCTAssertEqual(15.0, t6)
    }



}
