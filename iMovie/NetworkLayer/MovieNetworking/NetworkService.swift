//
//  NetworkService.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 27.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

enum SourceURL: String {
  case popular = "https://api.themoviedb.org/3/movie/popular"
  case topRaited = "https://api.themoviedb.org/3/movie/top_rated"
  case genresList = "https://api.themoviedb.org/3/genre/movie/list"
  case upcoming = "https://api.themoviedb.org/3/movie/upcoming"
  case downloadImage = "https://image.tmdb.org/t/p/w500"
  case discover = "https://api.themoviedb.org/3/discover/movie"
  case trendingMovieWeek = "https://api.themoviedb.org/3/trending/movie/week"
  case trendingMovieDay = "https://api.themoviedb.org/3/trending/movie/day"
}

enum RequestGenres: Int {
  case comedy = 35
  case thriller = 53
  case adventure = 12
  case romance = 10749
  case drama = 18
  case scienceFiction = 878
}

typealias MoviesResponse = (ResponseMovies?, String?) -> Void
typealias GenreListResponse = (MovieGenres?, String?) -> Void


class NetworkService {
  private let router: NetworkRouterProtocol = NetworkRouter()
  private let apiKey = "8e8e3f9f37ff081f3672802e50dff0a0"
  private let language = "ru-RU"
  private var defaultParams: [String: String] {
    return ["api_key":apiKey, "language": language, "page": "1"]
  }
  static let shared = NetworkService()
  
  func getGenreList(completion: @escaping GenreListResponse) {
    getData(url: .genresList) { (data, error) in
      if error != nil {
        completion(nil, error)
        return
      }
      guard let data = data else { fatalError("No Data") }
      let resultDecoded: MovieGenres  = MoviesDecoder.decodeMovies(data: data)
      completion(resultDecoded, error)
    }
  }

  
  func getMoviesByGenre(completion: @escaping MoviesResponse, genreList: [RequestGenres]) {
    if genreList.isEmpty {fatalError("Set genres")}
    var params = defaultParams
    params["sort_by"] = "vote_average.des"
    var genre = ""
    for i in genreList {
      genre += "\(i.rawValue),"
    }
    genre.removeLast()
    params["with_genres"] = genre

    getData(url: .discover, params: params) { (data, error) in
      if let error = error {
        completion(nil, error)
        return
      }
      guard let data = data else { fatalError("No Data") }
      let resultDecoded: ResponseMovies  = MoviesDecoder.decodeMovies(data: data)
      completion(resultDecoded, error)
    }
  }
  
  func getMoviesBy(contentType: SourceURL, completion: @escaping MoviesResponse) {
    getData(url: contentType) { (data, error) in
      if error != nil {
        completion(nil, error)
        return
      }
      guard let data = data else { fatalError("No Data") }
      let resultDecoded: ResponseMovies  = MoviesDecoder.decodeMovies(data: data)
      completion(resultDecoded, error)
    }
  }
  
  fileprivate func getData(url: SourceURL, params: [String: String] = [:], completion: @escaping (Data?, String?) -> Void) {
    var urlString: String
    switch url {
    case .popular: urlString = SourceURL.popular.rawValue
    case .topRaited: urlString = SourceURL.topRaited.rawValue
    case .genresList: urlString = SourceURL.genresList.rawValue
    case .upcoming: urlString = SourceURL.upcoming.rawValue
    case .discover: urlString = SourceURL.discover.rawValue
    case .trendingMovieDay: urlString = SourceURL.trendingMovieDay.rawValue
    case .trendingMovieWeek: urlString = SourceURL.trendingMovieWeek.rawValue
    case .downloadImage: return
    }
    
    let params = params.count == 0 ? defaultParams : params
    router.request(url: urlString, method: .get, parapms: params, headers: nil) { (data, response, error) in
      if let error = error {
        let error = error.localizedDescription
        completion(nil, error)
        return
      }
      if let response = response as? HTTPURLResponse {
        let result = self.handleResponse(response: response)
        switch result {
        case .success:
          completion(data, nil)
        case .failure(let error): completion(nil, error)
        }
      } else {
        completion(nil, "No response")
        return
      }
    }
  }
  
  fileprivate func handleResponse(response: HTTPURLResponse) -> Result<String> {
    switch response.statusCode {
    case 200...299:
      return .success
    case 401...500:
      return .failure(ResponseErrors.badReauest.rawValue)
    case 501...599:
      return .failure(ResponseErrors.badReauest.rawValue)
    case 600:
      return .failure(ResponseErrors.badReauest.rawValue)
    default:
      return .failure(ResponseErrors.badReauest.rawValue)
    }
  }
  
  
}
