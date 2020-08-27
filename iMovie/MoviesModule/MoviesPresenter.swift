//
//  MoviesPresenter.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol MoviesPresenterProtocol: class {
  var items: [Movie] {get}
  var sections: [MoviesSection] {get}
  var router: MoviesRouterProtocol! {get set}
  func configureView()
  func sendMovies(movies: [Movie])
  func requestMoviesForMain()
}

class MoviesPresenter: MoviesPresenterProtocol {
  var items: [Movie] = []
  
  var sections: [MoviesSection] = []
  
  weak var view: MoviesViewProtocol!
  var router: MoviesRouterProtocol!
  var interactor: MoviesInteractorProtocol!
  
  func configureView() {
    
  }
  
  func sendMovies(movies: [Movie]) {
    items = movies
    sections.append(MoviesSection(name: "Popular"))
    view.displayPopularMovies()
  }
  
  func requestMoviesForMain() {
    interactor.requestMainMovies()
  }
  
  required init(view: MoviesViewProtocol) {
    self.view = view
  }
}
