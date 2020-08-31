//
//  DetailConfigurator.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 31.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol DetailConfiguratorType: class {
  func configure(viewController: DetailViewController)
}

class DetailConfigurator: DetailConfiguratorType {
  func configure(viewController: DetailViewController) {
    
    let presenter = DetailPresenter(view: viewController)
    let interactor = DetailInteractor(presenter: presenter)
    let router = DetailRouter(viewController: viewController)
    
    presenter.router = router
    presenter.interactor = interactor
    viewController.presenter = presenter
  }
}
