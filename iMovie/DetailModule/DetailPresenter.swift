//
//  DetailPresenter.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 31.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol DetailPresenterType: class {
  var router: DetailRouterType! {get set}
  func configureView(movieId: Int)
//  func sendMovieDetail(model: MovieDetail)
}

class DetailPresenter: DetailPresenterType {
  
  weak var view: DetailViewProtocol!
  var router: DetailRouterType!
  var interactor: DetailInteractorType!
  
  func configureView(movieId: Int) {
    interactor.getMovieDetail(by: movieId)
  }
  
  init(view: DetailViewProtocol) {
    self.view = view
  }
  
}
