//
//  Hong3StoreAppTapUITests.swift
//  Hong3StoreAppTapUITests
//
//  Created by Hongdonghyun on 2020/06/23.
//  Copyright © 2020 hong3. All rights reserved.
//

import XCTest

class Hong3StoreAppTapUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        app.launch()
        super.setUp()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func test_success_tableViewcells_SwipeLeftRight() throws {
        // UI tests must launch the application that they test.
        // Use recording to get started writing UI tests.
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let root = app.tables["rootTableView"]
        let preViewCell = app.tables.cells["PreviewTableCell"]
        let topgrossCell = app.tables.cells["topgrossCell"]
        let freeAllCell = app.tables.cells["freeAllCell"]
        let paidAllCell = app.tables.cells["paidAllCell"]
        
        preViewCell.swipeLeft()
        preViewCell.swipeRight()
        
        topgrossCell.swipeLeft()
        topgrossCell.swipeRight()
        
        root.swipeUp()
        
        freeAllCell.swipeLeft()
        freeAllCell.swipeRight()
        
        paidAllCell.swipeLeft()
        paidAllCell.swipeRight()
        
//        addTeardownBlock {
//            preViewCell.swipeRight()
//        }
                
    }
    
    func test_success_rootViewSwipeTopDown() {
        let root = app.tables["rootTableView"]
        root.swipeUp()
        XCTAssertTrue(root.staticTexts["유료 앱"].waitForExistence(timeout: 1))
        root.swipeUp()
        root.swipeDown()
        root.swipeDown()
        XCTAssertTrue(root.staticTexts["최고매출 앱"].waitForExistence(timeout: 1))
    }

    func test_success_preView_Tap() {
        let preViewCell = app.tables.cells["PreviewTableCell"]
        
        preViewCell.swipeLeft()
        preViewCell.tap()
        XCTAssertTrue(app.staticTexts["detailTitleLabel"].waitForExistence(timeout: 1))
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    func test_success_tap_topgrossView() {
        let topgrossCell = app.tables.cells["topgrossCell"]
        topgrossCell.swipeLeft()
        topgrossCell.tap()
        XCTAssertTrue(app.staticTexts["detailTitleLabel"].waitForExistence(timeout: 1))
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
    }
    
    func test_success_display_detailView() {
        let preViewCell = app.tables.cells["PreviewTableCell"]
        preViewCell.tap()
//        XCTAssertTrue(app.staticTexts["detailTitleLabel"].waitForExistence(timeout: 1))
//        XCTAssertTrue(app.staticTexts["새로운 기능"].waitForExistence(timeout: 1))
    }
    
    func test_success_moreBtn_tap_detailView() {
        app.buttons.element(matching: .any, identifier: "detailMoreBtn").tap()
    }
    
}
