//
//  GenreCollectionViewCell.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 28.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
  static let reuseId = String(describing: GenreCollectionViewCell.self)
  @IBOutlet weak var genreName: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    
//    layer.addSublayer(gradient)
    layer.cornerRadius = 6
    genreName.font = UIFont(name: "SourceSansPro-Semibold", size: 17)
    genreName.textColor = .white
  }
  
  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    let gradient = CAGradientLayer()
    gradient.frame = bounds
    gradient.colors = [#colorLiteral(red: 0.9843137255, green: 0.7803921569, blue: 0.831372549, alpha: 1).cgColor, #colorLiteral(red: 0.5921568627, green: 0.5882352941, blue: 0.9411764706, alpha: 1).cgColor]
    gradient.startPoint = CGPoint(x: 0, y: 0)
    gradient.endPoint = CGPoint(x: 1, y: 1)
    backgroundColor = .blue
    
    layer.insertSublayer(gradient, at: 0)
  }
  
}
