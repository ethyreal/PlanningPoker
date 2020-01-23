//
//  PokerService.swift
//  PlanningPoker
//
//  Created by George Webster on 1/23/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import Foundation


class PokerService {

    func loadCards(_ completion: @escaping (Result<[Card], Error>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(.success(Card.allCases))
        }
    }
}

protocol CardLoading {
    func loadCards(_ completion: @escaping (Result<[Card], Error>) -> Void)
}

extension PokerService: CardLoading {}
