//
//  CardDetailTests.swift
//  PlanningPokerTests
//
//  Created by George Webster on 1/23/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import XCTest
@testable import PlanningPoker

class CardDetailTests: XCTestCase {

    func testCardDisplays() {
        
        Card.allCases.forEach { (card) in
            let sut = CardDetailViewController(card: card)
            _ = sut.view
            XCTAssert(sut.cardLabel.text == card.description)
        }
    }

}
