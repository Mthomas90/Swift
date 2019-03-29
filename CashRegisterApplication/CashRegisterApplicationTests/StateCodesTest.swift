//
//  StateCodesTest.swift
//  CashRegisterApplicationTests
//
//  Created by 007 on 28/03/2019.
//  Copyright © 2019 007. All rights reserved.
//

import XCTest

@testable import CashRegisterApplication
class StateCodesTest: XCTestCase {

    //Testing if the getPercentage method returns correct percentage
    func testStatesMethod() {
        let p1 = StateCodesFinder.getPercentage(stateCode: "UT")
        XCTAssertEqual(p1, 6.85)
        let p2 = StateCodesFinder.getPercentage(stateCode: "NV")
        XCTAssertEqual(p2, 8.00)
        let p3 = StateCodesFinder.getPercentage(stateCode: "TX")
        XCTAssertEqual(p3, 6.25)
    }
    
    //Testing getPercentage with wrong state code if it returns nil
    func testWrongStateCode() {
        XCTAssertNil(StateCodesFinder.getPercentage(stateCode: "XB"))
        XCTAssertNil(StateCodesFinder.getPercentage(stateCode: "1B"))
        XCTAssertNil(StateCodesFinder.getPercentage(stateCode: "35"))
    }

}
