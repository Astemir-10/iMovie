//
//  CollectionListViewController.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 29.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class CollectionListViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var presenter: CollectionListPresenterType!
  var navigationTitle: String?
  var contentType: SourceURL!
  let configurator: CollectionListConfiguratorType! = CollectionListConfigurator()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    configurator.configure(with: self)
    presenter.configureView(type:contentType)
  }
  
  fileprivate func setupUI() {
    let nib = UINib(nibName: MoviesCollectionViewCell.reuseId, bundle: nil)
    collectionView.register(nib.self, forCellWithReuseIdentifier: MoviesCollectionViewCell.reuseId)
    collectionView.delegate = self
    collectionView.dataSource = self
    let layout = UICollectionViewFlowLayout()
    collectionView.collectionViewLayout = layout
    title = navigationTitle
  }
}

// MARK: - CollextionView delegate dataSource flowDelegate
extension CollectionListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return presenter.movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionViewCell.reuseId, for: indexPath) as! MoviesCollectionViewCell
    let movie = presenter.movies[indexPath.row]
    cell.configure(movie)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: 141, height: 257)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 8, left: 20, bottom: 0, right: 20)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return CGFloat(20)
  }
  
}

extension CollectionListViewController: CollectionListViewProtocol {
  func dataRecived() {
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
  
  
}

struct CollectionListCellModel: MoviesCellModelProtocol {
  var title: String
  var imageURL: String
  var movieId: Int
  var genres: [Int]
  var releaseDate: String
  var voteAvg: Double
  var overview: String
}
