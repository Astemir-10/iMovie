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
}

typealias PopularMoviesResponse = (PopularMovies?, String?) -> Void

class NetworkService {
  private let router: NetworkRouterProtocol = NetworkRouter()
  private let apiKey = "8e8e3f9f37ff081f3672802e50dff0a0"
  private let language = "ru-RU"
  private var defaultParams: [String: String] {
    return ["api_key":apiKey, "language": language]
  }
  
  func getPopularMovies(completion: @escaping PopularMoviesResponse) {
    router.request(url: SourceURL.popular.rawValue, method: .get, parapms: defaultParams, headers: nil) { (data, response, error) in
      if let error = error {
        let error = error.localizedDescription
        completion(nil, error)
        return
      }
      
      if let response = response as? HTTPURLResponse {
        let result = self.handleResponse(response: response)
        switch result {
        case .success:
          guard let data = data else {
            fatalError("No Data")
          }
          let popularMoviesRespponse: PopularMovies = MoviesDecoder.decodeMovies(data: data)
          completion(popularMoviesRespponse, nil)
        case .failure(let error):
          completion(nil, error)
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

enum ResponseErrors: String {
  case authorizationError   = "You need to be authorizated first."
   case unableToDecode       = "We could not do decode the response."
   case badReauest           = "Bad Request."
   case outdated             = "The url you requested is outdated."
   case noData               = "Response returned with no data to decode."
   case failed               = "Network request failed."
   case success
}

enum Result<String> {
  case success
  case failure(String)
}
