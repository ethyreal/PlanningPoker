//
//  MenuViewController.swift
//  PlanningPoker
//
//  Created by George Webster on 1/21/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {


    var onPokerSelect: () -> Void = {}
    
    var container: UIStackView = {
        let v = UIStackView.init(frame: .zero)
        v.axis = .vertical
        v.alignment = .center
        v.spacing = 10
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu"
        
        view.backgroundColor = .white
        view.addChild(container, constrainedTo: .init(top: 20, left: 5, bottom: 5, right: 20))
        
        let play = UIButton(type: .custom)
        play.addTarget(self, action: #selector(showPoker), for: .touchUpInside)
        play.setTitle("Play Poker", for: .normal)
        play.setTitleColor(.black, for: .normal)
        container.addArrangedSubview(play)
    }
    

    @objc func showPoker() {
        onPokerSelect()
    }
}

