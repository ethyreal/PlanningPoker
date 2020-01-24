//
//  CardPickerTests.swift
//  PlanningPokerTests
//
//  Created by George Webster on 1/23/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import XCTest
@testable import PlanningPoker

class CardPickerTests: XCTestCase {}

//MARK:- View Tests

extension CardPickerTests {

    func testCardsLoad() {
        
        let exp = expectation(description: "loading")
        let dependencies = MockDependencies()
        dependencies.pokerService.result = .success(Card.allCases)
        dependencies.pokerService.onComplete = { _ in
            exp.fulfill()
        }
        let sut = CardPickerViewController(with: dependencies)
        _ = sut.view

        XCTAssert(sut.collectionView.numberOfItems(inSection: 0) == 0)

        wait(for: [exp], timeout: 10)

        XCTAssert(sut.collectionView.numberOfItems(inSection: 0) > 0)
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

        XCTAssert(sut.collectionView.numberOfItems(inSection: 0) == 0)
        wait(for: [exp], timeout: 10)
        XCTAssert(sut.collectionView.numberOfItems(inSection: 0) == 0)
    }

}


//MARK:- ViewModel Tests

extension CardPickerTests {

    func testDefaults() {
        
        let dependencies = MockDependencies()
        let sut = CardPickerViewModel(with: dependencies)
        switch sut.state.mode {
        case .normal: break//pass
        default: XCTFail()
        }
        XCTAssert(sut.state.numberOfCards == 0)
    }
    
    func testLoadCards_failure() {
        let exp = expectation(description: "loading")
        let dependencies = MockDependencies()
        dependencies.pokerService.result = .failure(MockError.networkError)
        dependencies.pokerService.onComplete = { _ in
            exp.fulfill()
        }
        let sut = CardPickerViewModel(with: dependencies)
        sut.loadCards()
        
        switch sut.state.mode {
        case .loading: break//pass
        default: XCTFail()
        }

        wait(for: [exp], timeout: 10)
        
        switch sut.state.mode {
        case .error: break//pass
        default: XCTFail()
        }
        XCTAssert(sut.state.numberOfCards == 0)
    }

    func testLoadCards_success() {
        let exp = expectation(description: "loading")
        let dependencies = MockDependencies()
        dependencies.pokerService.result = .success(Card.allCases)
        dependencies.pokerService.onComplete = { _ in
            exp.fulfill()
        }
        let sut = CardPickerViewModel(with: dependencies)
        sut.loadCards()
        
        switch sut.state.mode {
        case .loading: break//pass
        default: XCTFail()
        }

        wait(for: [exp], timeout: 10)
        
        switch sut.state.mode {
        case .normal: break//pass
        default: XCTFail()
        }
        XCTAssert(sut.state.numberOfCards == Card.allCases.count)
    }
    
    func testSelectCard() {
        
        let exp = expectation(description: "loading")
        let dependencies = MockDependencies()
        dependencies.pokerService.result = .success(Card.allCases)
        dependencies.pokerService.onComplete = { _ in
            exp.fulfill()
        }

        let sut = CardPickerViewModel(with: dependencies)
        sut.loadCards()
        wait(for: [exp], timeout: 10)

        sut.didSelectedCard(at: 0)
        switch sut.state.mode {
        case .selected(let card):
            XCTAssert(card.description == Card.allCases[0].description)
        default: XCTFail()
        }

    }


}
