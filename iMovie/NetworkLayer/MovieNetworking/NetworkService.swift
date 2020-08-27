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
  
  func getPopularMovies(completion: @escaping MoviesResponse) {
    getData(url: SourceURL.popular) { (data, error) in
      if error != nil {
        completion(nil, error)
        return
      }
      guard let data = data else { fatalError("No Data") }
      let resultDecoded: ResponseMovies  = MoviesDecoder.decodeMovies(data: data)
      completion(resultDecoded, error)
    }
  }
  
  func getTopRaitedMovies(completion: @escaping MoviesResponse) {
    getData(url: SourceURL.topRaited) { (data, error) in
      if error != nil {
        completion(nil, error)
        return
      }
      guard let data = data else { fatalError("No Data") }
      let resultDecoded: ResponseMovies  = MoviesDecoder.decodeMovies(data: data)
      completion(resultDecoded, error)
    }
  }
  
  func getGenreList(completion: @escaping GenreListResponse) {
    print("OK")
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
  
  func getUpcoming(completion: @escaping MoviesResponse) {
    getData(url: SourceURL.upcoming) { (data, error) in
      if error != nil {
        completion(nil, error)
        return
      }
      guard let data = data else { fatalError("No Data") }
      let resultDecoded: ResponseMovies  = MoviesDecoder.decodeMovies(data: data)
      completion(resultDecoded, error)
    }
  }
  
  fileprivate func getData(url: SourceURL, completion: @escaping (Data?, String?) -> Void) {
    var urlString: String
    switch url {
    case .popular: urlString = SourceURL.popular.rawValue
    case .topRaited: urlString = SourceURL.topRaited.rawValue
    case .genresList: urlString = SourceURL.genresList.rawValue
    case .upcoming: urlString = SourceURL.upcoming.rawValue
    }
    router.request(url: urlString, method: .get, parapms: defaultParams, headers: nil) { (data, response, error) in
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
