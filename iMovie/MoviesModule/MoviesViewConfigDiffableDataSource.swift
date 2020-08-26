//
//  MoviesViewConfigDiffableDataSource.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 27.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

// MARK: Configuration Diffable Data Source
extension MoviesViewController {
  internal func setupUI() {
    navigationController?.navigationBar.prefersLargeTitles = true
    title = "Кино"
    setupCollectionView()
    configurationDiffableDataSource()
  }
  
  fileprivate func setupCollectionView() {
    collectionView.collectionViewLayout = createCompositionLayout()
    let moviesCellNib = UINib(nibName: MoviesCollectionViewCell.reuseId, bundle: nil)
    collectionView.register(moviesCellNib, forCellWithReuseIdentifier: MoviesCollectionViewCell.reuseId)
  }
  
  fileprivate func createCompositionLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { (section: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
      return self.createMovieloayout()
    }
    return layout
  }
  
  fileprivate func configurationDiffableDataSource() {
    diffableDataSource =
      UICollectionViewDiffableDataSource<MoviesSection, MoviesItem>(collectionView: collectionView,
                                                                    cellProvider:
        { (collectionView, indexPath, moviesItem) -> UICollectionViewCell? in
          guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionViewCell.reuseId, for: indexPath) as? MoviesCollectionViewCell else {return nil}
          cell.backgroundColor = .black
          return cell
      })
    let snapshot = generateSnapshot()
    diffableDataSource.apply(snapshot)
  }
  
  fileprivate func createMovieloayout() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                           heightDimension: .fractionalHeight(1 / 4))
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    let section = NSCollectionLayoutSection(group: group)
    return section
  }
  
  fileprivate func generateSnapshot() -> NSDiffableDataSourceSnapshot<MoviesSection, MoviesItem> {
    var snapshot = NSDiffableDataSourceSnapshot<MoviesSection, MoviesItem>()
    snapshot.appendSections(presenter.sections)
    snapshot.appendItems(presenter.items)
    return snapshot
  }
}
