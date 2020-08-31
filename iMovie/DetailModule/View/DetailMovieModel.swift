//
//  DetailMovieModel.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 31.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol DetailModelProtocol {
  var title: String {get}
  var titleOriginal: String {get}
  var studioName: String {get}
  var tagline: String {get}
  var geners: [String] {get}
  var releaseDate: String {get}
  var country: String {get}
  var time: Int {get}
  var raiting: Double {get}
  var overview: String {get}
}
