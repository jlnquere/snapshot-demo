//
//  CocoaConfUITests.swift
//  CocoaConfUITests
//
//  Created by Julien on 02/01/2017.
//  Copyright © 2017 Sinplicity. All rights reserved.
//

import XCTest

class CocoaConfUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    
    func testScreenshots() {
        
        let app = XCUIApplication()

        XCUIDevice.shared().orientation = .portrait
        
        let tabBarsQuery = XCUIApplication().tabBars
        

        // Home
        tabBarsQuery.buttons.element(boundBy: 0).tap()
        snapshot("0-Home")
        
        // Map
        tabBarsQuery.buttons.element(boundBy: 1).tap()
        app.otherElements["eventlocation"].tap()
        snapshot("1-Map")

        
        // Twitter
        tabBarsQuery.buttons.element(boundBy: 2).tap()
        snapshot("2-Map", waitForLoadingIndicator: true)

    }
    
}
