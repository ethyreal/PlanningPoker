//
//  AppCoordinatorTests.swift
//  PlanningPokerTests
//
//  Created by George Webster on 1/23/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import XCTest
@testable import PlanningPoker

class AppCoordinatorTests: XCTestCase {

    func testMainMenuVisableAtLaunch() {
        
        let app = AppCoordinator()
        app.start(animated: false)
        
        guard let nav = app.rootController as? UINavigationController else { XCTFail(); return }
        guard let visibleController = nav.visibleViewController else { XCTFail(); return }
        XCTAssert(visibleController is MenuViewController)
    }
    
    func testShowPlaningPocker() {

        let app = AppCoordinator()
        app.start(animated: false)
        app.showPlanningPoker(animated: false)
        
        guard let nav = app.rootController as? UINavigationController else { XCTFail(); return }
        guard let visibleController = nav.visibleViewController else { XCTFail(); return }
        XCTAssert(visibleController is CardPickerViewController)
    }

    func testShowCardDetail() {

        let app = AppCoordinator()
        app.start(animated: false)
        app.showPlanningPoker(animated: false)
        guard let card = Card.allCases.first else { XCTFail(); return }
        app.showCardDetail(card, animated: false)

        guard let nav = app.rootController as? UINavigationController else { XCTFail(); return }
        guard let visibleController = nav.visibleViewController else { XCTFail(); return }
        XCTAssert(visibleController is CardDetailViewController)

    }
    

}
