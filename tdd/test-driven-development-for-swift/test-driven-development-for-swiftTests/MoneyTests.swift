//
//  MoneyTests.swift
//  test-driven-development-for-swiftTests
//

import Foundation
import XCTest

class MoneyTests: XCTestCase {
    func testMultiplication() {
        Dollar five = Dollar(5)
        five.times(2)
        XCTAssertEqual(10, five)
    }
}
