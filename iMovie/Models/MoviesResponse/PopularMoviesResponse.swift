//
//  PopularMoviesResponse.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 27.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

struct ResponseMovies: Decodable {
  let results: [Movie]
}
