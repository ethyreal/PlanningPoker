//
//  PlanningPokerViewController.swift
//  MVVMCExample
//
//  Created by George Webster on 1/6/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import UIKit

class CardPickerViewController: UICollectionViewController {

    var cards: [Card] = []
    private let service = PokerService()
    private var loadingController: LoadingViewController?
    
    private let sectionInsets = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20)
    private let cardsPerRow = 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "Planning Poker"
        setupView()
        
        loadCards()
        //TODO: uncomment to show error handling on load
        //showError(nil)
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

    func loadCards() {
        showLoadingView()
        service.loadCards { [weak self] (result) in
            switch result {
            case .success(let cards):
                self?.cards = cards
                self?.collectionView.reloadData()
            case .failure(let error):
                self?.showError(error)
            }
            self?.hideLoadingView()
        }
    }
    
    func showLoadingView() {
        if loadingController != nil {
            hideLoadingView()
        }
        let loading = LoadingViewController()
        loading.willMove(toParent: self)
        view.addSubview(loading.view)
        loading.didMove(toParent: self)
        loadingController = loading
    }
    
    func hideLoadingView() {
        loadingController?.willMove(toParent: nil)
        loadingController?.view.removeFromSuperview()
        loadingController?.removeFromParent()
        loadingController?.didMove(toParent: nil)
        loadingController = nil
    }
    
    func showError(_ error: Error?) {
        let alert = UIAlertController(title: "Oh Nos!", message: "Something when terrably wrong, want to try again?", preferredStyle: .alert)

        let action = UIAlertAction(title: "Retry?", style: .default) { [weak self] (_) in
            self?.loadCards()
        }
        alert.addAction(action)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }

}



//MARK:- UICollectionViewDataSource

extension CardPickerViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        cards.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardCell
        let card = cards[indexPath.row]
        cell.label.text = card.description
        
        return cell
    }
    
}

//MARK:- UICollectionViewDelegate

extension CardPickerViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = cards[indexPath.row]
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


class PokerService {

    func loadCards(_ completion: @escaping (Result<[Card], Error>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(.success(Card.allCases))
        }
    }
}
