//
//  MockPokerService.swift
//  PlanningPokerTests
//
//  Created by George Webster on 1/23/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import Foundation
@testable import PlanningPoker

class MockPokerService: CardLoading {
    
    var result: Result<[Card], Error> = .failure(MockError.networkError)
    
    var delay = 0.0

    var onComplete:(Result<[Card], Error>) -> Void = { _ in }
    
    func loadCards(_ completion: @escaping (Result<[Card], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            completion(self.result)
            self.onComplete(self.result)
        }
    }

}

enum MockError: Error {
    case networkError
}
