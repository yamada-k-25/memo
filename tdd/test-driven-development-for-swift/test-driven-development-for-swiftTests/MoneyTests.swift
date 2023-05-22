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
        XCTAssertEqual(Dollar(10), five.times(2))
        XCTAssertEqual(Dollar(15), five.times(3))
    }
    
    func testEquality() {
        // 三角測量
        XCTAssertTrue(Dollar(5).equals(Dollar(5)))
        XCTAssertFalse(Dollar(5).equals(Dollar(6)))
        XCTAssertTrue(Franc(5).equals(Franc(5)))
        XCTAssertFalse(Franc(5).equals(Franc(6)))
    }
    
    func testFrancMultiplication() {
        let five = Franc(5)
        XCTAssertEqual(Franc(10), five.times(2))
        XCTAssertEqual(Franc(15), five.times(3))
    }
}
