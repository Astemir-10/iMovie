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
  
  internal func configurationDiffableDataSource() {
    diffableDataSource =
      UICollectionViewDiffableDataSource<MoviesSection, Movie>(collectionView: collectionView,
                                                                    cellProvider:
        { (collectionView, indexPath, moviesItem) -> UICollectionViewCell? in
          guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionViewCell.reuseId, for: indexPath) as? MoviesCollectionViewCell else {return nil}
          cell.filmName.text = moviesItem.title
          cell.posterImage.loadImage(url: moviesItem.posterUrl)
          cell.backgroundColor = .lightGray
          return cell
      })
    let snapshot = generateSnapshot()
    diffableDataSource.apply(snapshot)
  }
  
  fileprivate func createMovieloayout() -> NSCollectionLayoutSection {
    
    let cellWidth = CGFloat(141)
    let cellHeight = cellWidth / 0.5726495726
    
    let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(cellWidth),
                                          heightDimension: .absolute(cellHeight))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(cellWidth * 3 + 24),
                                           heightDimension: .absolute(cellHeight))
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    group.interItemSpacing = .fixed(8)
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    return section
  }
  
  fileprivate func generateSnapshot() -> NSDiffableDataSourceSnapshot<MoviesSection, Movie> {
    var snapshot = NSDiffableDataSourceSnapshot<MoviesSection, Movie>()
    if !presenter.sections.isEmpty {
      snapshot.appendSections(presenter.sections)
      snapshot.appendItems(presenter.items)
    }
    return snapshot
  }
}
