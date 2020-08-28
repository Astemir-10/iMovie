//
//  UpcomingCollectionViewCell.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 28.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
  static let reuseId = String(describing: UpcomingCollectionViewCell.self)
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var genreLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var posterImageView: UIImageView!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
}
