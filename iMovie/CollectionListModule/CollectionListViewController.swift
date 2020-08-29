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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let nib = UINib(nibName: MoviesCollectionViewCell.reuseId, bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: MoviesCollectionViewCell.reuseId)
    // Do any additional setup after loading the view.
  }
}

// MARK: - CollextionView delegate dataSource flowDelegate
extension CollectionListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionViewCell.reuseId, for: indexPath) as! MoviesCollectionViewCell
    return cell
  }
  
  
}

extension CollectionListViewController: CollectionListViewProtocol {
  
}
