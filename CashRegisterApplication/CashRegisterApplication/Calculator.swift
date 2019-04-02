//
//  Calculator.swift
//  CashRegisterApplication
//
//  Copyright © 2019 007. All rights reserved.
//

import Foundation

struct Calculator {
    
    //calculating total price
    static func calculateTotalPrice(quant: Int, price: Double) -> Double {
        return Double(quant) * price
    }
    
    //calculating tax and amount
    static func calculateTax(stateCode: String, totalPrice: Double) -> (Double,Double) {
        var percentAndAmount = (percent: 0.0, amount: 0.0)
        if let value = StateCodesFinder.getPercentage(stateCode: stateCode) {
            percentAndAmount.percent = value
            percentAndAmount.amount = totalPrice * value / 100
            return percentAndAmount
        } else {
            return percentAndAmount
        }
    }
    
    //Method that calculates discount and amount
    static func calculateDiscount(totalPrice: Double) -> (Double,Double) {
        var discountRateAndAmount = (rate: 0.0, amount: 0.0)
        let value = DiscountRate.getDiscountRate(total: totalPrice)
        if value > 0.0 {
            discountRateAndAmount.rate = value
            discountRateAndAmount.amount = totalPrice * value / 100
            return discountRateAndAmount
        } else {
            return discountRateAndAmount
        }
    }
}
