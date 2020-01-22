//
//  UIView+Layout.swift
//  PlanningPoker
//
//  Created by George Webster on 1/21/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import UIKit

extension UIView {

    public func addChild(_ child: UIView, constrainedTo insets: UIEdgeInsets) {
        child.translatesAutoresizingMaskIntoConstraints = false
        addSubview(child)
        constrain(child, to: insets)
    }
    
    public func constrain(_ child: UIView, to insets: UIEdgeInsets = .zero) {
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
            child.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom),
            child.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
            child.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.right)
        ])
    }
    
    public func centerInSuperView() {
        guard let parent = superview else { return }
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            centerYAnchor.constraint(equalTo: parent.centerYAnchor)
        ])
    }
}

