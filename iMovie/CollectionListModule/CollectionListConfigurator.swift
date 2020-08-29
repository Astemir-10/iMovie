//
//  CollectionListConfigurator.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 29.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol CollectionListConfiguratorType: class  {
  func configure(with viewController: CollectionListViewController)
}

class CollectionListConfigurator: CollectionListConfiguratorType {
  func configure(with viewController: CollectionListViewController) {
    let presenter = CollectionListPresenter(view: viewController)
    let interactor = CollectionListInteractor(presenter: presenter)
    let router = CollectionListRouter(viewController: viewController)
    
    presenter.interactor = interactor
    presenter.router = router
    viewController.presenter = presenter
  }
}
