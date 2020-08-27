//
//  MoviesViewController.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  var diffableDataSource: UICollectionViewDiffableDataSource<MoviesSection, Movie>!
  
  var presenter: MoviesPresenterProtocol!
  let congigurator: MoviesConfiguratorProtocol = MoviesConfigurator()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    congigurator.configure(with: self)
    presenter.configureView()
    setupUI()
    presenter.requestMoviesForMain()
  }
}


// MARK: - MoviesViewProtocol
extension MoviesViewController: MoviesViewProtocol {
  func displayPopularMovies() {
    print(presenter.sections.count)
    DispatchQueue.main.async {
      self.configurationDiffableDataSource()
    }
  }
}


