//
//  RequestTests.swift
//  RequestTests
//
//  Created by Hongdonghyun on 2020/06/17.
//  Copyright © 2020 hong3. All rights reserved.
//

import XCTest
@testable import Hong3Store

class RequestTests: XCTestCase {
    private var sut: URLSession!
    
    // 셋업단계
    // 테스트코드 실행전 호출
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = URLSession(configuration: .default)
    }
    
    // 종료단계
    // 테스트코드 실행후 호출
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testRssItunesGetHttpStatusCode200() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let url = URL(string: "https://" + Constants.baseUrl + Constants.detailUrl + Constants.EndPoint.freeAll.rawValue + Constants.pagination.hundred.rawValue)
        let promise = expectation(description: "Status Code 200")
        
        let task = sut.dataTask(with: url!) { data, response, error in
            if let error = error {
                XCTFail("Fail: \(error.localizedDescription)")
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Fail StatusCode: \(statusCode)")
                }
            }
        }
        task.resume()
        wait(for: [promise], timeout: 5)
    }
    
    func testDetailPageGetHttpStatusCode200() throws {
        let url = URL(string: "https://" + Constants.detailBaseUrl + Constants.EndPoint.appInfo.rawValue + "?id=362057947&country=kr")
        let promise = expectation(description: "Request Complete")
        var statusCode: Int?
        var responseError: Error?
        let task = sut.dataTask(with: url!) { data, response ,error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        task.resume()
        wait(for: [promise], timeout: 5)
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    // 성능테스트
    // 시간측정
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//
//        }
//    }
}
