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
  var upcomingMovies: [MoviesItem] {get}
  var weekTrendMovies: [MoviesItem] {get}
  var sections: [MoviesSection] {get}
  var router: MoviesRouterProtocol! {get set}
  func configureView()
  func sendMovies(movies: [Movie])
  func requestMoviesForMain()
  func sendGenres(genres: [Genre])
  func requestGenres()
  func requestTopRaited()
  func sendTopRaitedMovies(movies: [Movie])
  func requestUpcoming()
  func sendUpcomingMovies(movies: [Movie])
  func requestWeekTrending()
  func sendWeekTrendingMovies(movies: [Movie])
}

class MoviesPresenter: MoviesPresenterProtocol {
  var popularMoviesItems: [MoviesItem] = []
  var genreItems: [MoviesItem] = []
  var topRaitedMovies: [MoviesItem] = []
  var upcomingMovies: [MoviesItem] = []
  var weekTrendMovies: [MoviesItem] = []
  
  var sections: [MoviesSection] = []
  
  weak var view: MoviesViewProtocol!
  var router: MoviesRouterProtocol!
  var interactor: MoviesInteractorProtocol!
  
  func configureView() {
    interactor.requestMainMovies()
    interactor.getTopRaited()
    interactor.getGenres()
    interactor.getWeekTrending()
    interactor.getUpcoming()
  }
  
  func sendMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: 1, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg)
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
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: 1, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg)
      topRaitedMovies.append(item)
    }
    sections.append(MoviesSection(name: "Top Raited", type: .topRaited))
//    view.displayPopularMovies()
  }
  
  func requestUpcoming() {
    interactor.getUpcoming()
  }
  
  func sendUpcomingMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: 1, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg)
      upcomingMovies.append(item)
    }
    sections.append(MoviesSection(name: "Top Raited", type: .topRaited))
//    view.displayPopularMovies()
  }
  
  func requestWeekTrending() {
    interactor.getWeekTrending()
  }
  
  func sendWeekTrendingMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: 1, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg)
      weekTrendMovies.append(item)
    }
    sections.append(MoviesSection(name: "Trending", type: .popular))
    print(sections.count)
    view.displayPopularMovies()
  }
}
