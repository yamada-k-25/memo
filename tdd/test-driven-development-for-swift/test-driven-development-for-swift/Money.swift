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
    
    func times(_ amount: Int) {
        self.amount *= amount
    }
}
