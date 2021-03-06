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
  var diffableDataSource: UICollectionViewDiffableDataSource<MoviesSection, MoviesItem>!
  
  var presenter: MoviesPresenterProtocol!
  let congigurator: MoviesConfiguratorProtocol = MoviesConfigurator()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    congigurator.configure(with: self)
    presenter.configureView()
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.prefersLargeTitles = true
  }
}


// MARK: - MoviesViewProtocol
extension MoviesViewController: MoviesViewProtocol {
  func displayPopularMovies() {
    DispatchQueue.main.async {
      self.configurationDiffableDataSource()
    }
  }
}


