//
//  HMoviesCollectionViewCell.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 28.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class HMoviesCollectionViewCell: UICollectionViewCell {
  static let reuseId = String(describing: HMoviesCollectionViewCell.self)
  @IBOutlet weak var posterImage: UIImageView!
  @IBOutlet weak var filmName: UILabel!
  @IBOutlet weak var filmGenre: UILabel!
  @IBOutlet weak var raitingLabel: UILabel!
  @IBOutlet weak var raitingView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    filmName.font = UIFont(name: "SourceSansPro-Regular", size: 14)
    filmGenre.font = UIFont(name: "SourceSansPro-Regular", size: 12)
    
     raitingLabel.font = UIFont(name: "SourceSansPro-Semibold", size: 13)
    raitingView.layer.cornerRadius = raitingView.frame.height / 2
    raitingView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    raitingView.clipsToBounds = true
    posterImage.layer.cornerRadius = 10
    posterImage.clipsToBounds = true
    raitingLabel.textColor = .white
  }
  
  
  
}
