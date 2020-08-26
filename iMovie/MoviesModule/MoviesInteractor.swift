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
    
  }
  
  required init(presenter: MoviesPresenterProtocol) {
    self.presenter = presenter
  }
}
