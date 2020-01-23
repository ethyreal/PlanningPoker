//
//  MockDependencies.swift
//  PlanningPokerTests
//
//  Created by George Webster on 1/23/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import Foundation
@testable import PlanningPoker

class MockDependencies {
    
    let pokerService: MockPokerService

    init() {
        self.pokerService = MockPokerService()
    }
}

extension MockDependencies: CardLoadingProvider {
    
    var cardLoadingService: CardLoading {
        pokerService
    }
}
