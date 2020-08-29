//
//  CollectionListInteractor.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 29.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol CollectionListInteractorType: class {
  func requestData(type: SourceURL)
}

class CollectionListInteractor: CollectionListInteractorType {
  weak var presenter: CollectionListPresenterType!
  
  func requestData(type: SourceURL) {
    NetworkService.shared.getMoviesBy(contentType: type) { (movies, error) in
      if let error = error {
        print(error)
        return
      }
      guard let movies = movies?.results else {return}
      self.presenter.sendMovies(movies: movies)
    }
  }
  
  init(presenter: CollectionListPresenterType) {
    self.presenter = presenter
  }
}
