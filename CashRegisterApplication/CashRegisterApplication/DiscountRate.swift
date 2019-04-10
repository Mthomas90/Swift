//
//  DiscountRate.swift
//  CashRegisterApplication
//  Copyright © 2019 007. All rights reserved.
//

import Foundation

//I was going to refactor the getDiscountRate but I decided not to
//Due to the fact I wont be increase the amounts of discount rates.(finite)

struct DiscountRate {
    static func getDiscountRate(total: Double) -> Double {
        if total < 1000 {
            return 0.0
        } else if (total >= 1000 && total < 5000) {
            return 3.0
        } else if (total >= 5000 && total < 7000) {
            return 5.0
        } else if (total >= 7000 && total < 10000) {
            return 7.0
        } else if (total >= 10000 && total < 50000) {
            return 10.0
        } else {
            return 15.0
        }
    }
    
}
