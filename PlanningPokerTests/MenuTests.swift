//
//  MenuTests.swift
//  PlanningPokerTests
//
//  Created by George Webster on 1/23/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import XCTest
@testable import PlanningPoker

class MenuTests: XCTestCase {

    func testMenuLoads() {
        
        let sut = MenuViewController()
        _ = sut.view // trigger view lifecycle
        
        let buttons = sut.view.childButtons
        XCTAssert(buttons.count > 0)
        XCTAssertNotNil(buttons.first { $0.title(for: .normal) == "Play Poker" })
    }
}

