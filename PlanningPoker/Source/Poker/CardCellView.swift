//
//  CardCell.swift
//  PlanningPoker
//
//  Created by George Webster on 1/21/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    let label: UILabel

    override init(frame: CGRect) {
        self.label = UILabel(frame: .zero)
        super.init(frame: frame)
        self.addChild(label, constrainedTo: .zero)
        self.label.textAlignment = .center
        self.label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

