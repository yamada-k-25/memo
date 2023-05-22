//
//  Money.swift
//  test-driven-development-for-swift
//

import Foundation

class Money {
    var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func equals(_ money: Money) -> Bool {
        self.amount == money.amount
    }
}
