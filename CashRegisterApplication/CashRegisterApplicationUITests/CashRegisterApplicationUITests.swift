//
//  CashRegisterApplicationUITests.swift
//  CashRegisterApplicationUITests
//
//  Copyright © 2019 007. All rights reserved.
//

import XCTest

class CashRegisterApplicationUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }


    //Testing the textfields in the View Controller
    func testUITextFields() {
    
        let app = XCUIApplication()
        let labelTextField = app.textFields["Label"]
        labelTextField.tap()
        labelTextField.typeText("test")
       
        XCTAssertEqual(labelTextField.value as! String, "test")
        
        let quauntTextField = app.textFields["Quantity"]
        quauntTextField.tap()
        quauntTextField.typeText("test")
        
        XCTAssertEqual(quauntTextField.value as! String, "test")
        
        let priceTextField = app.textFields["Price"]
        priceTextField.tap()
        priceTextField.typeText("test")
        
        XCTAssertEqual(priceTextField.value as! String, "test")
        
        let stateTextField = app.textFields["State"]
        stateTextField.tap()
        stateTextField.typeText("test")
        
        XCTAssertEqual(stateTextField.value as! String, "test")
        
    }
    
    //Testing order button in view controller
    func testUIButton() {
       let app = XCUIApplication()
       let orderButton = app.buttons["Order"]
       XCTAssertTrue(orderButton.isEnabled)
       orderButton.tap()
       
    }
    
    //Testing the receipt view controller popup
    //Because Of the way the receipt pop up is designed
    //I have to populate all the textfields and press the order button in the test
    //to allow the testing to be smooth
    func testReceiptPopup() {
        
        let app = XCUIApplication()
        let labelTextField = app.textFields["Label"]
        labelTextField.tap()
        labelTextField.typeText("test: Trainer")
        
        let quauntTextField = app.textFields["Quantity"]
        quauntTextField.tap()
        quauntTextField.typeText("30")
        
        let priceTextField = app.textFields["Price"]
        priceTextField.tap()
        priceTextField.typeText("100")
        
        let stateTextField = app.textFields["State"]
        stateTextField.tap()
        stateTextField.typeText("UT")
        
        let orderButton = app.buttons["Order"]
        orderButton.tap()
        
        let labelOfItemsLabel = app.staticTexts["Label1"]
        XCTAssertEqual(labelOfItemsLabel.label, "test: Trainer")
        
        let quantityLabel = app.staticTexts["Quantity1"]
        XCTAssertEqual(quantityLabel.label, "30")
        
        let unitPriceLabel = app.staticTexts["Unit1"]
        XCTAssertEqual(unitPriceLabel.label, "100.0")
        
        let totalPriceLabel = app.staticTexts["Total1"]
        XCTAssertEqual(totalPriceLabel.label, "3115.5")
       
        let totalWithoutTaxLabel = app.staticTexts["TWT"]
        XCTAssertEqual(totalWithoutTaxLabel.label, "3000.0")
        
        let discountLabel = app.staticTexts["Discount"]
        XCTAssertEqual(discountLabel.label, "90.0")
        
        
        let taxLabel = app.staticTexts["Tax"]
        XCTAssertEqual(taxLabel.label, "205.5")
        
        let totalPriceLabelBottom = app.staticTexts["Tp"]
        XCTAssertEqual(totalPriceLabelBottom.label, "3115.5")
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let closeButton = app.buttons["Close"]
        XCTAssertTrue(closeButton.isEnabled)
        closeButton.tap()
    
}
}
