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
  var dayTrendMovies: [MoviesItem] {get}
  var sections: [MoviesSection] {get}
  var router: MoviesRouterProtocol! {get set}
  func configureView()
  func sendMovies(movies: [Movie])
  func sendGenres(genres: [Genre])
  func sendTopRaitedMovies(movies: [Movie])
  func sendUpcomingMovies(movies: [Movie])
  func sendWeekTrendingMovies(movies: [Movie])
  func sendDayTrendingMovies(movies: [Movie])

}

class MoviesPresenter: MoviesPresenterProtocol {
  var popularMoviesItems: [MoviesItem] = []
  var genreItems: [MoviesItem] = []
  var topRaitedMovies: [MoviesItem] = []
  var upcomingMovies: [MoviesItem] = []
  var weekTrendMovies: [MoviesItem] = []
  var dayTrendMovies: [MoviesItem] = []
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
    interactor.getDayTrending()
  }
  
  func sendMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: i.id, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg, overview: i.overview ?? "")
      let containsMovie = moviesSet.insert(item)
      if containsMovie.inserted {
        popularMoviesItems.append(item)
      }
    }
    sections.append(MoviesSection(name: "Популярные фильмы", type: .popular))
    view.displayPopularMovies()
  }
  
  func sendGenres(genres: [Genre]) {
    for i in genres {
      let item = MoviesItem(title: i.name, imageURL: "", movieId: 1, genres: [], releaseDate: "", voteAvg: 0.0, overview: "")
      let containsMovie = moviesSet.insert(item)
      if containsMovie.inserted {
        genreItems.append(item)
      }
    }
    sections.append(MoviesSection(name: "Жанры", type: .genre))
    view.displayPopularMovies()
  }

  func sendTopRaitedMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: i.id, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg, overview: i.overview ?? "")
      let containsMovie = moviesSet.insert(item)
      if containsMovie.inserted {
        topRaitedMovies.append(item)
      }
    }
    sections.append(MoviesSection(name: "Топ", type: .topRaited))

  }

  func sendUpcomingMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: i.id, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg, overview: i.overview ?? "")
      let containsMovie = moviesSet.insert(item)
      if containsMovie.inserted {
        upcomingMovies.append(item)
      }
    }
    sections.append(MoviesSection(name: "Скоро в кино", type: .genre))
    view.displayPopularMovies()
  }
  
  func sendWeekTrendingMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: i.id, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg, overview: i.overview ?? "")
      let containsMovie = moviesSet.insert(item)
      if containsMovie.inserted {
        weekTrendMovies.append(item)
      }
    }
    sections.append(MoviesSection(name: "Тренды недели", type: .popular))
    view.displayPopularMovies()
  }
  
  func sendDayTrendingMovies(movies: [Movie]) {
    for i in movies {
      let item = MoviesItem(title: i.title, imageURL: i.posterUrl ?? "", movieId: i.id, genres: i.genres, releaseDate: i.dateRelease ?? "", voteAvg: i.voteAvg, overview: i.overview ?? "")
      let containsMovie = moviesSet.insert(item)
      if containsMovie.inserted {
        dayTrendMovies.append(item)
      }
    }
    sections.append(MoviesSection(name: "Тренды дня", type: .popular))
    view.displayPopularMovies()
  }
  
  required init(view: MoviesViewProtocol) {
    self.view = view
  }
}
