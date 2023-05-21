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
        five.times(2)
        XCTAssertEqual(10, five.ammount)
    }
}
