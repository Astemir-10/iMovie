//
//  MoviesJSONDecoder.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 27.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

public class MoviesDecoder  {
  static func decodeMovies<T: Decodable>(data: Data) -> T {
    do {
      let decoder = JSONDecoder()
      let result = try decoder.decode(T.self, from: data)
      return result
    } catch {
      print(error)
    }
    fatalError("Error while decoded \(T.self)")
  }
}
