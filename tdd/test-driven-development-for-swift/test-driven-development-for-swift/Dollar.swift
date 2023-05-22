//
//  Dollar.swift
//  test-driven-development-for-swift
//
//  Created by 山田一希 on 2023/05/21.
//

import Foundation

class Dollar: Money, Equatable {
    init(_ amount: Int) {
        super.init(amount: amount)
    }
    
    func  times(_ multiplier: Int) -> Dollar {
        return Dollar(self.amount*multiplier)
    }
    
    static func == (lhs: Dollar, rhs: Dollar) -> Bool {
        lhs.equals(rhs)
    }
}
