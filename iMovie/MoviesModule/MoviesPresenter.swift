//
//  MoviesPresenter.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol MoviesPresenterProtocol: class {
  var popularMoviesItems: [MoviesItem] {get}
  var genreItems: [MoviesItem] {get}
  var topRaitedMovies: [MoviesItem] {get}
  var sections: [MoviesSection] {get}
  var router: MoviesRouterProtocol! {get set}
  func configureView()
  func sendMovies(movies: [Movie])
  func requestMoviesForMain()
  func sendGenres(genres: [Genre])
  func requestGenres()
  func requestTopRaited()
  func sendTopRaitedMovies(movies: [Movie])
}

class MoviesPresenter: MoviesPresenterProtocol {
  var popularMoviesItems: [MoviesItem] = []
  var genreItems: [MoviesItem] = []
  var topRaitedMovies: [MoviesItem] = []
  
  var sections: [MoviesSection] = []
  
  weak var view: MoviesViewProtocol!
  var router: MoviesRouterProtocol!
  var interactor: MoviesInteractorProtocol!
  
  func configureView() {
    
  }
  
  func sendMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl, movieId: 1, genres: i.genres, releaseDate: i.dateRelease, voteAvg: i.voteAvg)
      popularMoviesItems.append(item)
    }
    sections.append(MoviesSection(name: "Popular", type: .popular))
//    view.displayPopularMovies()
  }
  
  func requestMoviesForMain() {
    interactor.requestMainMovies()
  }
  
  required init(view: MoviesViewProtocol) {
    self.view = view
  }
  
  func sendGenres(genres: [Genre]) {
    for i in genres {
      let item = MoviesItem(title: i.name, imageURL: "", movieId: 1, genres: [], releaseDate: "", voteAvg: 0.0)
      genreItems.append(item)
    }
    sections.append(MoviesSection(name: "Genres", type: .genre))
//    view.displayPopularMovies()
  }
  
  func requestGenres() {
    interactor.getGenres()
  }
  
  func requestTopRaited() {
    interactor.getTopRaited()
  }
  
  func sendTopRaitedMovies(movies: [Movie]) {
    
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl, movieId: 1, genres: i.genres, releaseDate: i.dateRelease, voteAvg: i.voteAvg)
      topRaitedMovies.append(item)
    }
    sections.append(MoviesSection(name: "Top Raited", type: .topRaited))
    view.displayPopularMovies()
  }
}
