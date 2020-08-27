//
//  Movie.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 27.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

struct Movie: Hashable {
  let title: String
  let posterUrl: String
}

extension Movie: Decodable {
  private enum MovieCodingKey: String, CodingKey {
    case title
    case posterUrl = "poster_path"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MovieCodingKey.self)
    title = try container.decode(String.self, forKey: .title)
    posterUrl = try container.decode(String.self, forKey: .posterUrl)
  }
}
