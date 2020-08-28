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
  }
  
  fileprivate func setupCollectionView() {
    collectionView.collectionViewLayout = createCompositionLayout()
    let moviesCellNib = UINib(nibName: MoviesCollectionViewCell.reuseId, bundle: nil)
    collectionView.register(moviesCellNib.self, forCellWithReuseIdentifier: MoviesCollectionViewCell.reuseId)
    
    let genreCellNib = UINib(nibName: GenreCollectionViewCell.reuseId, bundle: nil)
    collectionView.register(genreCellNib.self, forCellWithReuseIdentifier: GenreCollectionViewCell.reuseId)
    
    let HMovieCellNib = UINib(nibName: HMoviesCollectionViewCell.reuseId, bundle: nil)
    collectionView.register(HMovieCellNib.self, forCellWithReuseIdentifier: HMoviesCollectionViewCell.reuseId)
    
    let UpcomingCellNib = UINib(nibName: UpcomingCollectionViewCell.reuseId, bundle: nil)
       collectionView.register(UpcomingCellNib.self, forCellWithReuseIdentifier: UpcomingCollectionViewCell.reuseId)
  }
  
  fileprivate func createCompositionLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { (section: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
      if section == 0 || section == 4 {
        return self.createMovieLayout()
      }
      if section == 1 {
        return self.createGenreLoyout()
      }
      if section == 2 {
        return self.creteTopRaitedMoviesLayout()
      }
      if section == 3 {
        return self.creteUpcomingLayout()
      }
      return nil
    }
    return layout
  }
  
  internal func configurationDiffableDataSource() {
    diffableDataSource =
      UICollectionViewDiffableDataSource<MoviesSection, MoviesItem>(collectionView: collectionView,
                                                                    cellProvider:
        { (collectionView, indexPath, moviesItem) -> UICollectionViewCell? in
          if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.reuseId, for: indexPath) as? GenreCollectionViewCell else {return nil}
            cell.genreName.text = moviesItem.title
            return cell
          }
          if indexPath.section == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HMoviesCollectionViewCell.reuseId, for: indexPath) as? HMoviesCollectionViewCell else {return nil}
            
            cell.backgroundColor = .black
            cell.posterImage.loadImage(url: moviesItem.imageURL)
            cell.posterImage.contentMode = .scaleAspectFill
            
            cell.filmName.text = moviesItem.title
            cell.raitingLabel.text = String(moviesItem.voteAvg)
            return cell
          }
          if indexPath.section == 0 || indexPath.section == 4 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionViewCell.reuseId, for: indexPath) as? MoviesCollectionViewCell else {return nil}
            cell.configure(moviesItem)
            return cell
          }
          
          if indexPath.section == 3 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.reuseId, for: indexPath) as? UpcomingCollectionViewCell else {return nil}
            cell.titleLabel.text = moviesItem.title
            cell.posterImageView.loadImage(url: moviesItem.imageURL)
            return cell
          }
  
          return nil
      })
    let snapshot = generateSnapshot()
    diffableDataSource.apply(snapshot)
  }
  
  fileprivate func createMovieLayout() -> NSCollectionLayoutSection {
    
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
  
  fileprivate func createGenreLoyout() -> NSCollectionLayoutSection {
    
    let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(140),
                                          heightDimension: .absolute(80))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(140 + 16),
                                           heightDimension: .absolute(80))
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    group.interItemSpacing = .fixed(8)
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    return section
  }
  
  fileprivate func creteTopRaitedMoviesLayout() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(250),
                                          heightDimension: .absolute(180))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(250 + 16),
                                           heightDimension: .absolute(180))
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    group.interItemSpacing = .fixed(8)
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    return section
  }
  
  fileprivate func creteUpcomingLayout() -> NSCollectionLayoutSection {
    let collectionWidth = collectionView.frame.width
    let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(collectionWidth - 16 - 20),
                                          heightDimension: .absolute(100))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(collectionWidth + 24),
                                           heightDimension: .absolute(200 + 16))
    
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
    group.interItemSpacing = .fixed(8)
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .groupPaging
    section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    return section
  }
  
  fileprivate func generateSnapshot() -> NSDiffableDataSourceSnapshot<MoviesSection, MoviesItem> {
    var snapshot = NSDiffableDataSourceSnapshot<MoviesSection, MoviesItem>()
    if !presenter.sections.isEmpty {
      if snapshot.numberOfSections == 0 {
        snapshot.appendSections(presenter.sections)
      }
//      snapshot.appendItems(presenter.popularMoviesItems)
      
      snapshot.appendItems(presenter.popularMoviesItems, toSection: presenter.sections[0])
      
//      snapshot.appendItems(presenter.genreItems)
      snapshot.appendItems(presenter.genreItems, toSection: presenter.sections[1])
      snapshot.appendItems(presenter.topRaitedMovies, toSection: presenter.sections[2])
      
//      snapshot.appendItems(presenter.topRaitedMovies)
      
      snapshot.appendItems(presenter.upcomingMovies, toSection: presenter.sections[3])
      snapshot.appendItems(presenter.weekTrendMovies, toSection: presenter.sections[4])

    }
    return snapshot
  }
}
