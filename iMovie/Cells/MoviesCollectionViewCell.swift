//
//  MoviesCollectionViewCell.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
  static let reuseId = String(describing: MoviesCollectionViewCell.self)
  @IBOutlet weak var posterImage: UIImageView!
  @IBOutlet weak var filmName: UILabel!
  @IBOutlet weak var filmGenre: UILabel!
  @IBOutlet weak var raitingLabel: UILabel!
  @IBOutlet weak var raitingView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    filmName.font = UIFont(name: "SourceSansPro-Regular", size: 15)
    filmGenre.font = UIFont(name: "SourceSansPro-Regular", size: 13)
    backgroundColor = .white
  }
  
}
