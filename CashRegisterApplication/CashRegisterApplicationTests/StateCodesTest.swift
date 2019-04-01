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
        let test1 = StateCodesFinder.getPercentage(stateCode: "UT")
        XCTAssertEqual(test1, 6.85)
        let test2 = StateCodesFinder.getPercentage(stateCode: "NV")
        XCTAssertEqual(test2, 8.00)
        let test3 = StateCodesFinder.getPercentage(stateCode: "TX")
        XCTAssertEqual(test3, 6.25)
    }
    
    //Testing getPercentage with wrong state code if it returns nil
    func testWrongStateCode() {
        XCTAssertNil(StateCodesFinder.getPercentage(stateCode: "XB"))
        XCTAssertNil(StateCodesFinder.getPercentage(stateCode: "1B"))
        XCTAssertNil(StateCodesFinder.getPercentage(stateCode: "35"))
    }

}
