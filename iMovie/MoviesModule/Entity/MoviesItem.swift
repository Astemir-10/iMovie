//
//  MoviesItem.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 28.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

struct MoviesItem: Hashable {
  let title: String
  let imageURL: String
  let movieId: Int
  let genres: [Int]
  let releaseDate: String
  let voteAvg: Double
}
