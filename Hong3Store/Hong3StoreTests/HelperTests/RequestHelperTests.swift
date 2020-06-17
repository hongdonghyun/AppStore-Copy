//
//  RequestHelperTests.swift
//  Hong3StoreTests
//
//  Created by Hongdonghyun on 2020/06/17.
//  Copyright © 2020 hong3. All rights reserved.
//

import XCTest
@testable import Hong3Store

class RequestHelperTests: XCTestCase {
    private var sut: RequestHelper!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = RequestHelper.shared
    }
    
    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testRequestHelperGetData() {
        let promise = expectation(description: "Get Data Success")
        sut.request(method: .get, pagination: .ten, endPoint: .newApps) { result in
            switch result {
            case .success:
                promise.fulfill()
            case .failure(let error):
                XCTFail("Fail: \(error.localizedDescription)")
            }
            
        }
        wait(for: [promise], timeout: 5)
    }
    
    func testRequestHelperGetDetailData() {
        let promise = expectation(description: "Get DetailData Success")
        sut.detailRequest(method: .get) {
            result in
            switch result {
            case .success:
                promise.fulfill()
            case .failure(let error):
                XCTFail("Fail: \(error.localizedDescription)")
            }
        }
        wait(for: [promise], timeout: 5)
    }
    
    func testDecodeDummyData() {
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "dummyData", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        if let _ = try? JSONDecoder().decode(AppStoreModel.self, from: data!) {
        } else {
            XCTFail("Fail: AppStoreModel decode fail")
        }
    }
    
    func testDecodeDetailDummyData() {
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "detailDummyData", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        if let _ = try? decoder.decode(AppInfo.self, from: data!) {
        } else {
            XCTFail("Fail: AppInfo decode fail")
        }
    }
}

