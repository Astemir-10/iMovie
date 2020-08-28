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
    filmName.font = UIFont(name: "SourceSansPro-Regular", size: 16)
    filmGenre.font = UIFont(name: "SourceSansPro-Regular", size: 14)
    filmGenre.adjustsFontSizeToFitWidth = true
//    filmGenre.numberOfLines = 0
    filmName.adjustsFontSizeToFitWidth = true
    
    posterImage.layer.cornerRadius = 12
    posterImage.clipsToBounds = true
    
    raitingLabel.textColor = .white

    raitingView.layer.cornerRadius = raitingView.frame.height / 2
    raitingView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    raitingView.clipsToBounds = true
    raitingView.backgroundColor = .red
    
    raitingLabel.font = UIFont(name: "SourceSansPro-Semibold", size: 14)
    
    
    backgroundColor = .white
  }
  
  func configure(_ model: Movie) {
    filmName.text = model.title
    posterImage.loadImage(url: model.posterUrl)
    
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: model.dateRelease)
    dateFormatter.dateFormat = "yyyy"
    let year = dateFormatter.string(from: date!)
    
    NetworkService.shared.getGenreList { (genres, error) in
      if let error = error {
        print(error)
        return
      }
      guard let genres = genres else {return}
      let currntGenres = genres.genres.filter {model.genres.contains($0.id)}.map{$0.name}
      if currntGenres.isEmpty {return}

      DispatchQueue.main.async {
        self.filmGenre.text = "\(currntGenres[0]), \(year)"
      }
    }
    
  }
  
}
