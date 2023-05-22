//
//  Franc.swift
//  test-driven-development-for-swift
//
//  Created by 山田一希 on 2023/05/22.
//

import Foundation

class Franc: Money, Equatable {
    init(_ amount: Int) {
        super.init(amount: amount)
    }
    
    func  times(_ multiplier: Int) -> Franc {
        return Franc(self.amount*multiplier)
    }
    
    static func == (lhs: Franc, rhs: Franc) -> Bool {
        lhs.equals(rhs)
    }
}
