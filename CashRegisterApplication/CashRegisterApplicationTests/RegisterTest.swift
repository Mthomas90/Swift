//
//  RegisterTest.swift
//  CashRegisterApplicationTests
//
//  Created by 007 on 28/03/2019.
//  Copyright © 2019 007. All rights reserved.
//

import XCTest

@testable import CashRegisterApplication
class RegisterTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    //Testing calculating totalPrice 
    //it is the first method called from initializer
    func testTotalPrice() {
        let test1 = Register(itemLabel: "Nike Trainer", quantity: 3, price: 29.99, state: "TX")
        XCTAssertEqual(test1.getTotalWithoutTax(), 89.97)
        let test2 = Register(itemLabel: "Server", quantity: 2, price: 4000, state: "UT")
        XCTAssertEqual(test2.getTotalWithoutTax(), 8000.0)
        let test3 = Register(itemLabel: "Macbook Laptop", quantity: 3, price: 1125, state: "NV")
        XCTAssertEqual(test3.getTotalWithoutTax(), 3375.0)
        let test4 = Register(itemLabel: "Iphone 8", quantity: 10, price: 2500, state: "AL")
        XCTAssertEqual(test4.getTotalWithoutTax(), 25000.0)
    }
    
    //Testing calculateTax and variables affected by the method
    //Second method called from initializer
    func testCalTax() {
        let test1 = Register(itemLabel: "Nike Trainer", quantity: 3, price: 29.99, state: "TX")
        XCTAssertEqual(test1.getTaxPercent(), 6.25)
        XCTAssertEqual(test1.getTaxAmount(), 5.623125) //totalBeforeTax * tax percent / 100
        
        let test2 = Register(itemLabel: "Server", quantity: 2, price: 4000, state: "NV")
        XCTAssertEqual(test2.getTaxPercent(), 8.0)
        XCTAssertEqual(test2.getTaxAmount(), 640.0) //totalBeforeTax * tax percent / 100
        
        let test3 = Register(itemLabel: "Polo t-shirt", quantity: 4, price: 25.99, state: "AL")
        XCTAssertEqual(test3.getTaxPercent(), 4.00)
        XCTAssertEqual(test3.getTaxAmount(), 4.158399999999999)
        //total price without tax * tax percent / 100
    }
    
    //Testing the calculateDiscount method and variables affected by the method
    func testCalDis() {
        let test1 = Register(itemLabel: "Sony TV", quantity: 2, price: 125, state: "CA")
        XCTAssertEqual(test1.getTotalWithoutTax(), 250)
        XCTAssertEqual(test1.getDiscount(), 0.0)
        XCTAssertEqual(test1.getTaxAmount(), 20.625)
        XCTAssertEqual(test1.getTotalPrice(), 270.625) //totalWithoutTax - discount + taxAmount
        
        let test2 = Register(itemLabel: "Bmw M3", quantity: 2, price: 20000, state: "UT")
        XCTAssertEqual(test2.getTotalWithoutTax(), 40000)
        XCTAssertEqual(test2.getDiscount(), 4000.0)
        XCTAssertEqual(test2.getTaxAmount(), 2740)
        XCTAssertEqual(test2.getTotalPrice(), 38740)
        
    }

}
