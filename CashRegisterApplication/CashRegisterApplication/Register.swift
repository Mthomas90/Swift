//
//  Register.swift
//  CashRegisterApplication
//
//  Copyright © 2019 007. All rights reserved.
//

import Foundation

class Register {
    
    private var itemLabel = String()
    private var quantityOfItem = Int()
    private var priceOfItem = Double()
    private var stateCode = String()
    
    private var discount = Double()
    private var totalPrice = Double()
    private var totalWithoutTax = Double()
    
    private var disPercent = Double()
    private var taxPercent = Double()
    private var taxAmount = Double()
    
    var receiptArray = [String: String]()
    var receipt: [String:String] {
        get {
            return receiptArray
        }
    }
    
    init(itemLabel: String, quantity: Int, price: Double, state: String) {
        self.itemLabel = itemLabel
        self.quantityOfItem = quantity
        self.priceOfItem = price
        self.stateCode = state
        self.totalWithoutTax = Calculator.calculateTotalPrice(quant: self.quantityOfItem, price: self.priceOfItem)
        calculateTax(value: Calculator.calculateTax(stateCode: self.stateCode, totalPrice: self.totalWithoutTax))
    }
    
    //Calculating the tax amount
    private func calculateTax(value: (Double,Double)) {
        if value.0 != 0.0 {
            self.taxPercent = value.0
            self.taxAmount = value.1
            calDiscount(dis: Calculator.calculateDiscount(totalPrice: totalWithoutTax))
        } else {
            print("Status code doesn't exist!!")
        }
    }
    
    //Calculating the discount
    private func calDiscount(dis: (Double, Double)) {
        self.disPercent = dis.0
        if disPercent > 0.0 {
            self.discount = dis.1
        } else {
            self.discount = 0.0
        }
        self.totalPrice = totalWithoutTax - discount + taxAmount
        receiptArray["label"] = self.itemLabel
        receiptArray["quantity"] = "\(self.quantityOfItem)"
        receiptArray["price"] = "\(self.priceOfItem)"
        receiptArray["total"] = "\(self.totalPrice)"
        receiptArray["totalnotax"] = "\(self.totalWithoutTax)"
        receiptArray["dispercent"] = "\(self.disPercent)"
        receiptArray["discount"] = "\(self.discount)"
        receiptArray["taxpercent"] = "\(self.taxPercent)"
        receiptArray["taxamount"] = "\(self.taxAmount)"
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
