//
//  CollectionListPresenter.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 29.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol CollectionListPresenterType: class  {
  var router: CollectionListRouterType! {get set}
  var movies: [MoviesCellModelProtocol] {get}
  func configureView(type: SourceURL)
  func sendMovies(movies: [Movie])
}

class CollectionListPresenter: CollectionListPresenterType {
  var movies: [MoviesCellModelProtocol] = []
  
  weak var view: CollectionListViewProtocol!
  var interactor: CollectionListInteractorType!
  var router: CollectionListRouterType!
  
  func configureView(type: SourceURL) {
    interactor.requestData(type: type)
  }
  
  func sendMovies(movies: [Movie]) {
    for i in movies {
      let movie = CollectionListCellModel(title: i.title, imageURL: i.posterUrl ?? "", movieId: i.id, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg, overview: i.overview ?? "")
      self.movies.append(movie)
    }
    view.dataRecived()
  }
  
  init(view: CollectionListViewProtocol) {
    self.view = view
  }
}
