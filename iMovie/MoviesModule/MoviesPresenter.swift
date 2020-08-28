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
  func sendGenres(genres: [Genre])
  func sendTopRaitedMovies(movies: [Movie])
  func sendUpcomingMovies(movies: [Movie])
  func sendWeekTrendingMovies(movies: [Movie])
}

class MoviesPresenter: MoviesPresenterProtocol {
  var popularMoviesItems: [MoviesItem] = []
  var genreItems: [MoviesItem] = []
  var topRaitedMovies: [MoviesItem] = []
  var upcomingMovies: [MoviesItem] = []
  var weekTrendMovies: [MoviesItem] = []
  private var moviesSet: Set<MoviesItem> = []
  
  var sections: [MoviesSection] = []
  
  weak var view: MoviesViewProtocol!
  var router: MoviesRouterProtocol!
  var interactor: MoviesInteractorProtocol!
  
  func configureView() {
    interactor.getWeekTrending()
    interactor.requestMainMovies()
    interactor.getTopRaited()
    interactor.getGenres()
    interactor.getUpcoming()
  }
  
  func sendMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: 1, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg)
      let containsMovie = moviesSet.insert(item)
      if containsMovie.inserted {
        popularMoviesItems.append(item)
      }
    }
    sections.append(MoviesSection(name: "Popular", type: .popular))
    view.displayPopularMovies()
  }
  
  func requestMoviesForMain() {
    interactor.requestMainMovies()
  }
  
  func sendGenres(genres: [Genre]) {
    for i in genres {
      let item = MoviesItem(title: i.name, imageURL: "", movieId: 1, genres: [], releaseDate: "", voteAvg: 0.0)
      let containsMovie = moviesSet.insert(item)
      if containsMovie.inserted {
        genreItems.append(item)
      }
    }
    sections.append(MoviesSection(name: "Genres", type: .genre))
    view.displayPopularMovies()
  }

  func sendTopRaitedMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: 1, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg)
      let containsMovie = moviesSet.insert(item)
      if containsMovie.inserted {
        topRaitedMovies.append(item)
      }
    }
    sections.append(MoviesSection(name: "Top Raited", type: .topRaited))

  }

  func sendUpcomingMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: 1, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg)
      let containsMovie = moviesSet.insert(item)
      if containsMovie.inserted {
        upcomingMovies.append(item)
      }
    }
    sections.append(MoviesSection(name: "Upcoming", type: .genre))
    view.displayPopularMovies()
  }
  
  func sendWeekTrendingMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: 1, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg)
      let containsMovie = moviesSet.insert(item)
      if containsMovie.inserted {
        weekTrendMovies.append(item)
      }
    }
    sections.append(MoviesSection(name: "Trending", type: .popular))
    view.displayPopularMovies()
  }
  
  required init(view: MoviesViewProtocol) {
    self.view = view
  }
}
