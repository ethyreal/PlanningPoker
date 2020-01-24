//
//  CardPickerViewModel.swift
//  PlanningPoker
//
//  Created by George Webster on 1/23/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import Foundation

class CardPickerViewModel {
    
    typealias LocalDependencies = CardLoadingProvider
    private let service: CardLoading

    private(set) var state: State {
        didSet { onStateChanged(state) }
    }
    
    var onStateChanged: (State) -> Void = { _ in }
    
    init(with dependencies: LocalDependencies) {
        self.service = dependencies.cardLoadingService
        self.state = State(with: .normal)
    }
    
    //MARK:- Actions
    
    func loadCards() {
        state.mode = .loading
        service.loadCards { [weak self] (result) in
            switch result {
            case .success(let cards):
                self?.state = State(with: cards)
            case .failure(let error):
                self?.state.mode = .error(error)
            }
        }
    }
    
    func didSelectedCard(at index: Int) {
        guard let card = state.card(at:index) else {
            return //TODO: should this be an error?
        }
        state.mode = .selected(card)
    }

}

extension CardPickerViewModel {
    
    struct State {

        var mode: DisplayMode
        
        private var cards: [Card] = []
        
        
        var numberOfCards: Int { cards.count }
        
        func card(at index: Int) -> Card? {
            cards[index]
        }
    }
    
}

extension CardPickerViewModel.State {
    
    init(with mode: CardPickerViewModel.DisplayMode) {
        self.mode = mode
        self.cards = []
    }

    init(with cards:[Card]) {
        self.mode = .normal
        self.cards = cards
    }
}

extension CardPickerViewModel {
    
    enum DisplayMode {

        case normal
        case loading
        case error(Error)
        case selected(Card)
    }
}

