//
//  AppCoordinator.swift
//  PlanningPoker
//
//  Created by George Webster on 1/22/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    var rootController: UIViewController { return nav }
    let nav = UINavigationController()
    
    @discardableResult
    func start(animated: Bool) -> Bool {
        showMenu(animated: animated)
        return true
    }

    func showMenu(animated: Bool) {
        let menu = MenuViewController()
        menu.onPokerSelect = { [weak self] in
            self?.showPlanningPoker(animated: true)
        }
        nav.setViewControllers([menu], animated: animated)
    }
    
    func showPlanningPoker(animated: Bool) {
        
        let poker = CardPickerViewController(collectionViewLayout: UICollectionViewFlowLayout())
        poker.onCardSelect = { [weak self] (card) in
            self?.showCardDetail(card, animated: true)
        }
        nav.pushViewController(poker, animated: animated)
    }
    
    func showCardDetail(_ card: Card, animated: Bool) {
        let vc = CardDetailViewController(card: card)
        nav.pushViewController(vc, animated: animated)
    }

    
}
