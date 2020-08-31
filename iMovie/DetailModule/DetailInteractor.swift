//
//  DetailInteractor.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 31.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol DetailInteractorType: class {
  func getMovieDetail(by id: Int)
}

class DetailInteractor: DetailInteractorType {
  weak var presenter: DetailPresenterType!
  
  
  
  
  func getMovieDetail(by id: Int) {
    
  }
  
  init(presenter: DetailPresenterType) {
    self.presenter = presenter
  }
  
}
