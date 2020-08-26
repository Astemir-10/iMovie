//
//  MoviesConfigurator.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol MoviesConfiguratorProtocol: class {
  func configure(with viewController: MoviesViewController)
}

class MoviesConfigurator: MoviesConfiguratorProtocol {
  func configure(with viewController: MoviesViewController) {
    let presenter = MoviesPresenter(view: viewController)
    let interacor = MoviesInteractor(presenter: presenter)
    let router = MoviesRouter(viewController: viewController)
    
    viewController.presenter = presenter
    presenter.router = router
    presenter.interactor = interacor
  }
}
