//
//  Register.swift
//  CashRegisterApplication
//
//  Copyright © 2019 007. All rights reserved.
//

import Foundation

class Register {
    
    private var itemLabel: String
    private var quantityOfItem: Int
    private var priceOfItem: Double
    private var stateCode: String
    
    private var discount = Double()
    private var totalPrice = Double()
    private var totalWithoutTax = Double()
    
    private var disPercent = Double()
    private var taxPercent = Double()
    private var taxAmount = Double()
    
    var receiptArray: [String: String] = [:]
    var receipt: [String:String] {
        get {
            return receiptArray
        }
    }
    var calculateTotalPrice: Double {
        return Double(quantityOfItem) * priceOfItem
    }
    
    init(itemLabel: String, quantity: Int, price: Double, state: String) {
        self.itemLabel = itemLabel
        self.quantityOfItem = quantity
        self.priceOfItem = price
        self.stateCode = state
        self.totalWithoutTax = calculateTotalPrice
        calculateTax(value: Calculator.calculateTax(stateCode: stateCode, totalPrice: totalWithoutTax))
    }
    
    //Calculating the tax amount
    private func calculateTax(value: (Double,Double)) {
        if value.0 != 0.0 {
            taxPercent = value.0
            taxAmount = value.1
            calculateDiscount(dis: Calculator.calculateDiscount(totalPrice: totalWithoutTax))
        } else {
            print("Status code doesn't exist!!")
        }
    }
    
    //Calculating the discount
    private func calculateDiscount(dis: (Double, Double)) {
        self.disPercent = dis.0
        if disPercent > 0.0 {
            discount = dis.1
        } else {
            discount = 0.0
        }
        totalPrice = totalWithoutTax - discount + taxAmount
        receiptArray["label"] = itemLabel
        receiptArray["quantity"] = "\(quantityOfItem)"
        receiptArray["price"] = "\(priceOfItem)"
        receiptArray["total"] = "\(totalPrice)"
        receiptArray["totalnotax"] = "\(totalWithoutTax)"
        receiptArray["dispercent"] = "\(disPercent)"
        receiptArray["discount"] = "\(discount)"
        receiptArray["taxpercent"] = "\(taxPercent)"
        receiptArray["taxamount"] = "\(taxAmount)"
    }
    
    //Getters for testing purposes
    func getTaxAmount() -> Double{
        return taxAmount
    }
    func getTotalWithoutTax()-> Double {
        return totalWithoutTax
    }
    func getTaxPercent() -> Double {
        return taxPercent
    }
    func getDiscount() -> Double {
        return discount
    }
    func getDiscountPercent()->Double {
        return disPercent
    }
    func getTotalPrice() -> Double {
        return totalPrice
    }
}
