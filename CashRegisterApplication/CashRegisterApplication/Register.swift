//
//  Register.swift
//  CashRegisterApplication
//
//  Created by 007 on 28/03/2019.
//  Copyright © 2019 007. All rights reserved.
//

import Foundation

//Makesure u have error catchers if its nill or empty
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
        calculateTotalPrice(quant: self.quantityOfItem, price: self.priceOfItem)
        calculateTax(sc: self.stateCode)
    }
    
    //Calculating the total price
    func calculateTotalPrice(quant: Int, price: Double) {
        self.totalWithoutTax = Double(quantityOfItem) * priceOfItem
    }
    
    //Calculating the tax amount to pay
    func calculateTax(sc: String) {
        
        if let value = StateCodesFinder.getPercentage(stateCode: sc) {
            self.taxPercent = value
            self.taxAmount = totalWithoutTax * taxPercent / 100
            calculateDiscount(tp: totalWithoutTax)
        } else {
            print("Status code doesnt exist!")
        }
    }
    
    //Calculating discount amount owed
    func calculateDiscount(tp: Double) {
        let value = DiscountRate.getDiscountRate(total: tp)
        self.disPercent = value
        if value > 0.0 {
            self.discount = tp * value / 100
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
        //print(receipt)
       
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
