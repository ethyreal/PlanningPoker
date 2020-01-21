//
//  CardDetailViewController.swift
//  PlanningPoker
//
//  Created by George Webster on 1/7/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {

    let model: Card
    
    var cardLabel: UILabel = { .init(frame: .zero) }()
    
    init(card: Card) {
        self.model = card
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        cardLabel.text = model.description
        cardLabel.font = UIFont.boldSystemFont(ofSize: 72)
        cardLabel.sizeToFit()
        view.addSubview(cardLabel)
        view.setNeedsDisplay()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        cardLabel.center = view.center

    }

}
