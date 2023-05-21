//
//  MoneyTests.swift
//  test-driven-development-for-swiftTests
//

import Foundation
import XCTest
@testable import test_driven_development_for_swift

class MoneyTests: XCTestCase {
    func testMultiplication() {
        let five = Dollar(5)
        var product = five.times(2)
        XCTAssertEqual(10, product.ammount)
        product = five.times(3)
        XCTAssertEqual(15, product.ammount)
    }
}
