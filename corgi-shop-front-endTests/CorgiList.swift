//
//  CorgiList.swift
//  corgi-shop-front-endTests
//
//  Created by Robin Schwenzfeier on 06.05.24.
//
import XCTest
import SwiftUI

@testable import corgi_shop_front_end

class CorgiListTests: XCTestCase {
    
    func testCorgiListDisplaysCorrectly() {
        let corgiList = CorgiList()
        
        let view = corgiList.body
        
        XCTAssertNotNil(view)
    }
    
    func testNavigationToCorgiDetail() {
        let corgiList = CorgiList()
        let corgiModel = CorgiModel()
        corgiModel.corgis = [Corgi(name: "Test Corgi", imageUrl: "test_image_url")]
        
        let view = corgiList.body
        
        guard let navigationLink = view as? NavigationLink<CorgiDetail, HStack<Text>> else {
            XCTFail("NavigationLink not found")
            return
        }
    }
    
    func testCorgiModelFetchesOnAppear() {
        let corgiList = CorgiList()
        let corgiModel = CorgiModel()
        let expectation = XCTestExpectation(description: "Fetch corgis")
        
        corgiList.onAppear()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertFalse(corgiModel.corgis.isEmpty)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testTabBarAppearance() {
        let corgiList = CorgiList()
        
        let view = corgiList.body
        
        XCTAssertEqual(UITabBar.appearance().unselectedItemTintColor, corgiList.tabItemNotSelected)
        XCTAssertEqual(UITabBar.appearance().backgroundColor, corgiList.tabBarUIColorBackground)
    }
    
}
