//
//  PlanningPokerViewController.swift
//  MVVMCExample
//
//  Created by George Webster on 1/6/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import UIKit

class CardPickerViewController: UICollectionViewController {

    var onCardSelect: (Card) -> Void = { _ in }
    
    private var loadingController: LoadingViewController?
    private let viewModel: CardPickerViewModel
    
    private let sectionInsets = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20)
    private let cardsPerRow = 3.0
    
    init(with dependencies: CardPickerViewModel.LocalDependencies) {
        self.viewModel = CardPickerViewModel(with: dependencies)
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "Planning Poker"
        setupView()
        viewModel.onStateChanged = updateState()
        viewModel.loadCards()
    }

    func setupView() {
        view.backgroundColor = .lightGray
        collectionView.backgroundColor = .lightGray
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCell")
    }
    
    func updateState() -> (CardPickerViewModel.State) -> Void {
        return { [weak self] state in
            switch state.mode {
            case .normal:
                self?.collectionView.reloadData()
                self?.hideLoadingView()
            case .loading:
                self?.showLoadingView()
            case .error(let error):
                self?.showError(error)
                self?.hideLoadingView()
            case .selected(let card):
                self?.onCardSelect(card)
            }
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
            self?.viewModel.loadCards()
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
        viewModel.state.numberOfCards
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCell else { fatalError() }
        guard let card = viewModel.state.card(at: indexPath.row) else { fatalError("tried to display a cell we don't have") }
        cell.label.text = card.description
        return cell
    }
    
}

//MARK:- UICollectionViewDelegate

extension CardPickerViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectedCard(at: indexPath.row)
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


