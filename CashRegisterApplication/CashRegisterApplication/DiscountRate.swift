//
//  DiscountRate.swift
//  CashRegisterApplication
//  Copyright © 2019 007. All rights reserved.
//

import Foundation


struct DiscountRate {
    
    static func getDiscountRate(total: Double) -> Double {
        switch total {
        case 0...1000:
            return 0.0
        case 1000...5000:
            return 3.0
        case 5000...7000:
            return 5.0
        case 7000...10000:
            return 7.0
        case 10000...50000:
            return 10.0
        default:
            return 15.0
        }
    }
}
