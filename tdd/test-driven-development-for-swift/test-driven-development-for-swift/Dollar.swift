//
//  Dollar.swift
//  test-driven-development-for-swift
//
//  Created by 山田一希 on 2023/05/21.
//

import Foundation

class Dollar {
    var ammount: Int
    
    init(_ ammount: Int) {
        self.ammount = ammount
    }
    
    func  times(_ multiplier: Int) {
        self.ammount *= multiplier
    }
}
