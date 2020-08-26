//
//  MoviesPresenter.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol MoviesPresenterProtocol: class {
  var router: MoviesRouterProtocol! {get set}
  func configureView()
}

class MoviesPresenter: MoviesPresenterProtocol {
  weak var view: MoviesViewProtocol!
  var router: MoviesRouterProtocol!
  var interactor: MoviesInteractorProtocol!
  
  func configureView() {
    
  }
  
  required init(view: MoviesViewProtocol) {
    self.view = view
  }
}
