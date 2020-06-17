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
    private var dummyData: Data!
    private var dummyDetailData: Data!
    
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
            case .success(let data):
                promise.fulfill()
                self.dummyData = data
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
            case .success(let data):
                promise.fulfill()
                self.dummyDetailData = data
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
        
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/kr/ios-apps/top-free/all/10/explicit.json")
        let urlResponse = HTTPURLResponse(
            url: url!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        let sessionMock = URLSessionDataTaskMock()
        sessionMock.taskResponse = (data, urlResponse, nil)
        
    }
}


final private class URLSessionDataTaskMock: URLSessionDataTask {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    var url: URL?
    var completionHandler: CompletionHandler?
    var taskResponse: (Data?, URLResponse?, Error?)?
    
    override init() {
        super.init()
    }
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.url = url
        self.completionHandler = completionHandler
        return self
    }
    
    override func resume() {
        DispatchQueue.main.async {
            self.completionHandler?(self.taskResponse?.0, self.taskResponse?.1, self.taskResponse?.2)
        }
    }
}
