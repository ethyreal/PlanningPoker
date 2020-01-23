//
//  LoadingViewController.swift
//  PlanningPoker
//
//  Created by George Webster on 1/22/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    let indicatorView = UIActivityIndicatorView(style: .whiteLarge)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(white: 0, alpha: 0.6)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.startAnimating()
        view.addSubview(indicatorView)
        indicatorView.centerInSuperView()
    }

}
