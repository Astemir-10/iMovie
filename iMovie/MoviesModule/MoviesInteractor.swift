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
  func getGenres()
  func getTopRaited()
  func getUpcoming()
  func getWeekTrending()
  func getDayTrending()
}

class MoviesInteractor: MoviesInteractorProtocol {
  weak var presenter: MoviesPresenterProtocol!
  
  
  func requestMainMovies() {
    NetworkService.shared.getMoviesBy(contentType: .popular) { (movies, error) in
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
  
  func getGenres() {
    NetworkService.shared.getGenreList { (genres, error) in
      if let error = error {
        print(error)
        return
      }
      guard let genres = genres else {return}
      self.presenter.sendGenres(genres: genres.genres)
    }
  }
  
  func getTopRaited() {
    NetworkService.shared.getMoviesBy(contentType: .topRaited) { (topRaitedMovies, error) in
      if let error = error {
        print(error)
        return
      }
      guard let movies = topRaitedMovies?.results else {return}
      self.presenter.sendTopRaitedMovies(movies: movies)
    }
  }
  
  func getUpcoming() {
   NetworkService.shared.getMoviesBy(contentType: .upcoming){ (topRaitedMovies, error) in
      if let error = error {
        print(error)
        return
      }
      guard let movies = topRaitedMovies?.results else {return}
      
      self.presenter.sendUpcomingMovies(movies: movies)
    }
  }
  
  func getWeekTrending() {
    NetworkService.shared.getMoviesBy(contentType: .trendingMovieWeek) { (weekTrending, error) in
      if let error = error {
        print(error)
        return
      }
      guard let movies = weekTrending?.results else {return}
      self.presenter.sendWeekTrendingMovies(movies: movies)
    }
  }
  
  func getDayTrending() {
   NetworkService.shared.getMoviesBy(contentType: .trendingMovieDay) { (trendingDay, error) in
      if let error = error {
        print(error)
        return
      }
      
      guard let movies = trendingDay?.results else {return}
      self.presenter.sendDayTrendingMovies(movies: movies)
    }
  }
  
  required init(presenter: MoviesPresenterProtocol) {
    self.presenter = presenter
  }
}
