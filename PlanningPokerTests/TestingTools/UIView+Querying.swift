//
//  UIView+Querying.swift
//  PlanningPokerTests
//
//  Created by George Webster on 1/23/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import UIKit


//MARK:- Traversal
extension UIView {
    
    func forEachSubviewDepthFirst(_ visit: (UIView) -> Void) {
        visit(self)
        subviews.forEach { $0.forEachSubviewDepthFirst(visit) }
    }
}

//MARK:- Elements

extension UIView {
    
    var childButtons:[UIButton] {
        var result:[UIButton] = []
        
        forEachSubviewDepthFirst { (view) in
            if let button = view as? UIButton {
                result.append(button)
            }
        }
        return result
    }
}
