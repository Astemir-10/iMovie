//
//  MovieDetail.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 31.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

struct MovieDetail {
  let movieImage: String?
  let genres: [Genre]
  let overview: String?
  let title: String
  let originalTitle: String
  let dateRelease: String
  let budget: Int
  let popularity: Double
  let revenue: Int
  let timing: Int
  let status: String
  let raiting: Double
  let countries: [ProductionCountry]
  let companies: [ProductionCompany]
  let tagline: String
}

extension MovieDetail: Decodable {
  
  private enum MovieDetailCodingKey: String, CodingKey {
    case movieImage = "poster_path"
    case genres = "genres"
    case overview
    case title
    case originalTitle = "original_title"
    case dateRelease = "release_date"
    case budget
    case popularity
    case revenue
    case timing = "runtime"
    case status
    case raiting = "vote_average"
    case countries = "production_countries"
    case companies = "production_companies"
    case tagline
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MovieDetailCodingKey.self)
    movieImage = try container.decode(String?.self, forKey: .movieImage)
    genres = try container.decode([Genre].self, forKey: .genres)
    overview = try container.decode(String?.self, forKey: .overview)
    title = try container.decode(String.self, forKey: .title)
    originalTitle = try container.decode(String.self, forKey: .originalTitle)
    dateRelease = try container.decode(String.self, forKey: .dateRelease)
    budget = try container.decode(Int.self, forKey: .budget)
    popularity = try container.decode(Double.self, forKey: .popularity)
    revenue = try container.decode(Int.self, forKey: .revenue)
    timing = try container.decode(Int.self, forKey: .timing)
    status = try container.decode(String.self, forKey: .status)
    raiting = try container.decode(Double.self, forKey: .raiting)
    countries = try container.decode([ProductionCountry].self, forKey: .countries)
    companies = try container.decode([ProductionCompany].self, forKey: .companies)
    tagline = try container.decode(String.self, forKey: .tagline)
  }
  
}


