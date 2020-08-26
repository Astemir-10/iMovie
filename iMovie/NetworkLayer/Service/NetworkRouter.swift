//
//  NetworkRouter.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 27.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

// MARK: - HTTP Typealeas
public typealias HTTPHeader = [String: String]
public typealias HTTPParams = [String: String]
public typealias HTTPResponse = (Data?, URLResponse?, Error?) -> Void

 
// MARK: - Router Protocol
protocol NetworkRouterProtocol {
  func request(url: String, method: HTTPMethod, parapms: HTTPParams?, headers: HTTPHeader?, completion: @escaping HTTPResponse)
  func cancel()
}

// MARK: - NetworkRouter
class NetworkRouter: NetworkRouterProtocol {
  private var task: URLSessionTask!
  
  func request(url: String, method: HTTPMethod = .get, parapms: HTTPParams? = [:], headers: HTTPHeader? = [:], completion: @escaping HTTPResponse) {
    let session = URLSession.shared
    guard let request = createRequest(url: url, method: method, params: parapms, headers: headers) else {
      fatalError("Non request")
    }
    task = session.dataTask(with: request) {data, response, error in
      completion(data, response, error)
    }
    task.resume()
  }
  
  func cancel() {
    if task == nil {return}
    task.cancel()
  }
  
  private func createRequest(url: String, method: HTTPMethod, params: HTTPParams?, headers: HTTPHeader?) -> URLRequest? {
    do {
      let url = try handleURL(url: url)
      var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
      let queryItems = handleURLParams(params: params)
      urlComponents?.queryItems = queryItems
      guard let urlOfUrlConponents = urlComponents?.url else {
        fatalError("Invalid url")
      }
      var request = URLRequest(url: urlOfUrlConponents)
      request.allHTTPHeaderFields = headers
      request.httpMethod = method.rawValue
      return request
    } catch let error {
      print(error)
    }
    fatalError("Error while creating URLRequest")
  }
  
  private func handleURL(url: String) throws -> URL {
    guard let url = URL(string: url) else {
      throw NetworkError.urlError
    }
    return url
  }
  
  private func handleURLParams(params: HTTPParams?) -> [URLQueryItem] {
    guard let params = params else {
      return []
    }
    var queryItems = [URLQueryItem]()
    
      for (key, value) in params {
        if let key = String(utf8String: key), let value = String(utf8String: value) {
          let query = URLQueryItem(name: key, value: value)
          queryItems.append(query)
        }
      }
    return queryItems
  }
}


