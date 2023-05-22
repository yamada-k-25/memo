//
//  Franc.swift
//  test-driven-development-for-swift
//
//  Created by 山田一希 on 2023/05/22.
//

import Foundation

class Franc: Equatable {
    private var ammount: Int
    
    init(_ ammount: Int) {
        self.ammount = ammount
    }
    
    func  times(_ multiplier: Int) -> Franc {
        return Franc(self.ammount*multiplier)
    }
    
    func equals(_ franc: Franc) -> Bool {
        self.ammount == franc.ammount
    }
    
    static func == (lhs: Franc, rhs: Franc) -> Bool {
        lhs.equals(rhs)
    }
}
