//
//  Card.swift
//  PlanningPoker
//
//  Created by George Webster on 1/21/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import Foundation

enum Card: CaseIterable {
    case question
    case infinate
    case half, one, two, three, five, eight, thirteen, twenty, forty, hundred
}

extension Card: CustomStringConvertible {
    var description: String {
        switch self {
            case .question: return "?"
            case .infinate: return "♾"
            case .half: return "1/2"
            case .one: return "1"
            case .two: return "2"
            case .three: return "3"
            case .five: return "5"
            case .eight: return "8"
            case .thirteen: return "13"
            case .twenty: return "20"
            case .forty: return "40"
            case .hundred: return "100"
        }
    }   
}
