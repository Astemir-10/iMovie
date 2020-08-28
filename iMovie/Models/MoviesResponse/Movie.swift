//
//  Movie.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 27.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

struct Movie {
  let title: String
  let posterUrl: String?
  let voteAvg: Double
  let genres: [Int]
  let dateRelease: String?
}

extension Movie: Decodable {
  private enum MovieCodingKey: String, CodingKey {
    case title
    case posterUrl = "poster_path"
    case voteAvg = "vote_average"
    case genres = "genre_ids"
    case dateRelease = "release_date"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MovieCodingKey.self)
    title = try container.decode(String.self, forKey: .title)
    posterUrl = try container.decode(String?.self, forKey: .posterUrl)
    voteAvg = try container.decode(Double.self, forKey: .voteAvg)
    genres = try container.decode([Int].self, forKey: .genres)
    dateRelease = try container.decode(String?.self, forKey: .dateRelease)
  }
}
