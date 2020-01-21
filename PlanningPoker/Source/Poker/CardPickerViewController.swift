//
//  PlanningPokerViewController.swift
//  MVVMCExample
//
//  Created by George Webster on 1/6/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import UIKit

class CardPickerViewController: UICollectionViewController {

    let model: [Card] = Card.allCases
    private let sectionInsets = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20)
    private let cardsPerRow = 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "Planning Poker"
        setupView()
    }

    func setupView() {
        view.backgroundColor = .lightGray
        collectionView.backgroundColor = .lightGray
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCell")
    }
    
    func showCardDetail(_ card: Card) {
        let vc = CardDetailViewController(card: card)
        navigationController?.pushViewController(vc, animated: true)
    }

}


//MARK:- UICollectionViewDataSource

extension CardPickerViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        model.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardCell
        let card = model[indexPath.row]
        cell.label.text = card.description
        
        return cell
    }
    
}

//MARK:- UICollectionViewDelegate

extension CardPickerViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = model[indexPath.row]
        showCardDetail(card)
    }
    
}

extension CardPickerViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let availableWidth = Double(collectionView.frame.width) - (Double(sectionInsets.left) * (cardsPerRow + 1))
        let width = availableWidth / cardsPerRow
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }
}

