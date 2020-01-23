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
        
        let sut = CardPickerViewController(collectionViewLayout: UICollectionViewFlowLayout())
        _ = sut.view

        XCTAssert(sut.cards.count == 0)

        // at the moment no other way to test the loading of cards
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
        
        XCTAssert(sut.cards.count > 0)
    }

}
