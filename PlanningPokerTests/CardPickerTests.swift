//
//  CardPickerTests.swift
//  PlanningPokerTests
//
//  Created by George Webster on 1/23/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import XCTest
@testable import PlanningPoker

class CardPickerTests: XCTestCase {

    func testCardsLoad() {
        
        let exp = expectation(description: "loading")
        let dependencies = MockDependencies()
        dependencies.pokerService.result = .success(Card.allCases)
        dependencies.pokerService.onComplete = { _ in
            exp.fulfill()
        }
        let sut = CardPickerViewController(with: dependencies)
        _ = sut.view

        XCTAssert(sut.cards.count == 0)

        wait(for: [exp], timeout: 10)
        
        XCTAssert(sut.cards.count > 0)
    }

    func testCardsLoad_failure() {
        
        let exp = expectation(description: "loading")
        let dependencies = MockDependencies()
        dependencies.pokerService.result = .failure(MockError.networkError)
        dependencies.pokerService.onComplete = { _ in
            exp.fulfill()
        }
        let sut = CardPickerViewController(with: dependencies)
        _ = sut.view

        XCTAssert(sut.cards.count == 0)
        wait(for: [exp], timeout: 10)
        XCTAssert(sut.cards.count == 0)
    }

}
