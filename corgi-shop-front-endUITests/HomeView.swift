//
//  HomeView.swift
//  corgi-shop-front-endTests
//
//  Created by Robin Schwenzfeier on 06.05.24.
//

import XCTest
import SwiftUI

@testable import corgi_shop_front_end

final class HomeViewTests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testHomeViewInitialState() throws {
        XCTAssertTrue(app.staticTexts["Hello, log in pls!"].exists)
        XCTAssertTrue(app.buttons["Log in"].exists)
        XCTAssertFalse(app.otherElements["loginSheet"].exists)
    }

    func testLoginButtonTapped() throws {
        app.buttons["Log in"].tap()
        XCTAssertTrue(app.otherElements["loginSheet"].exists)
    }

    func testLoginSheetDismissed() throws {
        app.buttons["Log in"].tap()
        app.otherElements["loginSheet"].swipeDown()
        XCTAssertFalse(app.otherElements["loginSheet"].exists)
    }

    func testLoginSuccessful() throws {
        app.buttons["Log in"].tap()
        XCTAssertFalse(app.otherElements["loginSheet"].exists)
        XCTAssertTrue(app.staticTexts["Welcome, User!"].exists)
    }

    func testLogoutButton() throws {
        XCTAssertTrue(app.staticTexts["Hello, log in pls!"].exists)
        XCTAssertTrue(app.buttons["Log in"].exists)
        XCTAssertFalse(app.staticTexts["Welcome, User!"].exists)
    }

}
