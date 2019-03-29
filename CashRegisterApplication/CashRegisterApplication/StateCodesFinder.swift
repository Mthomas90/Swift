//
//  StateCodesFinder.swift
//  CashRegisterApplication
//
//  Created by 007 on 28/03/2019.
//  Copyright © 2019 007. All rights reserved.
//

import Foundation


class StateCodesFinder {
    static func getPercentage(stateCode: String) -> Double? {
        let states = ["UT": 6.85, "NV": 8.00, "TX": 6.25, "AL": 4.00, "CA": 8.25, "AZ": 5.6, "FL": 6.00, "CO": 2.90, "HI": 4.166,"IN": 7.00]
        
        if let value = states[stateCode] {
            return value
        }
        else {
            return nil
        }
    }
}
