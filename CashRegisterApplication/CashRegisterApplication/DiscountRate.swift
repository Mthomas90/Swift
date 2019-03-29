//
//  DiscountRate.swift
//  CashRegisterApplication
//
//  Created by 007 on 28/03/2019.
//  Copyright © 2019 007. All rights reserved.
//

import Foundation

class DiscountRate {
    
    static func getDiscountRate(total: Double)-> Double {
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
