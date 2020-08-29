//
//  MoviesRouter.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol MoviesRouterProtocol: class {
  func openYetMovies(section: Int)
}

class MoviesRouter: MoviesRouterProtocol {
  weak var viewController: MoviesViewController!
  
  init(viewController: MoviesViewController) {
    self.viewController = viewController
  }
  /*
  if indexPath.section == 0 {
    supplayment.titleLabel.text = "Популярные фильмы"
  } else if indexPath.section == 1 {
    supplayment.titleLabel.text = "Жанры"
  } else if indexPath.section == 2 {
    supplayment.titleLabel.text = "Топ"
  } else if indexPath.section == 3 {
    supplayment.titleLabel.text = "Скоро в кино"
  } else if indexPath.section == 4 {
    supplayment.titleLabel.text = "Тренды недели"
  } else if indexPath.section == 5 {
    supplayment.titleLabel.text = "Тренды дня"
  }
 */
  
  func openYetMovies(section: Int) {
    let collectionList: CollectionListViewController = CollectionListViewController.loadFromStoryboard()
    switch section {
    case 0:
      collectionList.navigationTitle = "Популярные фильмы"
      collectionList.contentType = .popular
    case 2:
      collectionList.navigationTitle = "Топ"
      collectionList.contentType = .topRaited
    case 3:
      collectionList.navigationTitle = "Скоро в кино"
      collectionList.contentType = .upcoming
    case 4:
      collectionList.navigationTitle = "Тренды недели"
      collectionList.contentType = .trendingMovieWeek
    case 5:
      collectionList.navigationTitle = "Тренды дня"
      collectionList.contentType = .trendingMovieDay
    default:
      break
    }
    viewController.navigationController?.pushViewController(collectionList, animated: true)
  }
  
  
  
  
}

