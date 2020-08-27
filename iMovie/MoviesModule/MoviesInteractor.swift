//
//  MoviesInteractor.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol MoviesInteractorProtocol {
  func requestMainMovies()
}

class MoviesInteractor: MoviesInteractorProtocol {
  weak var presenter: MoviesPresenterProtocol!
  
  
  func requestMainMovies() {
    NetworkService.shared.getPopularMovies { (movies, error) in
      if let error = error {
        print(error)
        return
      }
      guard let movies = movies else {
        print("No movies")
        return
      }
      self.presenter.sendMovies(movies: movies.results)
    }
  }
  
  required init(presenter: MoviesPresenterProtocol) {
    self.presenter = presenter
  }
}
