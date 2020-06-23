//
//  ConversionHelperTests.swift
//  Hong3StoreTests
//
//  Created by Hongdonghyun on 2020/06/18.
//  Copyright © 2020 hong3. All rights reserved.
//

import XCTest
@testable import Hong3Store

class ConversionHelperTests: XCTestCase {
    
    var startDate: Date!
    var endDate: Date!
    
    override func setUpWithError() throws {
        startDate = Date(timeIntervalSinceReferenceDate: .zero)
        endDate = startDate.addingTimeInterval(86400)
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        endDate = nil
        startDate = nil
        super.tearDown()
    }
    
    func test_success_strArrTostr() {
        XCTAssertEqual(strArrToStr(["게임", "롤플레잉", "전략"]), "게임, 롤플레잉, 전략")
    }
    
    func test_success_byteToMB() {
        XCTAssertEqual(byteToMB("1024"), "1 KB")
    }
    
    func test_fail_byteToMB() {
        XCTAssertNotEqual(byteToMB("1024"), "1 MB")
    }
    
    func test_fail_InputValueDifferent_byteToMB() {
        XCTAssertEqual(byteToMB("Error Value"), "0")
    }
    
    func test_success_daysBetween() {
        XCTAssertEqual(daysBetween(start: startDate, end: endDate), 1)
    }
    
    func test_fail_daysBetween() {
        XCTAssertNotEqual(daysBetween(start: startDate, end: endDate), 50)
    }
    
    func test_success_digitDivider() {
        XCTAssertEqual(digitDivider(10), "10개의 평가")
        XCTAssertEqual(digitDivider(100), "100개의 평가")
        XCTAssertEqual(digitDivider(1000), "1.0천개의 평가")
        XCTAssertEqual(digitDivider(10000), "1.0만개의 평가")
        XCTAssertEqual(digitDivider(100000), "10.0만개의 평가")
    }
    
    func test_fail_digitDivider() {
        XCTAssertNotEqual(digitDivider(1000), "1천개의 평가")
        XCTAssertNotEqual(digitDivider(10000), "1만개의 평가")
        XCTAssertNotEqual(digitDivider(100000), "10만개의 평가")
    }
    
    func test_success_starPrint() {
        XCTAssertEqual(starPrint(4), "★★★★")
        XCTAssertEqual(starPrint(3), "★★★")
        XCTAssertEqual(starPrint(10), "★★★★★")
        
        XCTAssertEqual(starPrint(0.5), "☆")
        XCTAssertEqual(starPrint(2.5), "★★☆")
        XCTAssertEqual(starPrint(2.1847), "★★")
        XCTAssertEqual(starPrint(2.49999), "★★")
        XCTAssertEqual(starPrint(4.9999), "★★★★☆")
    }
}
