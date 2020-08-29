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
    titleLabel.font = UIFont(name: "SourceSansPro-Regular", size: 16)
    genreLabel.font = UIFont(name: "SourceSansPro-Regular", size: 14)
    genreLabel.textColor = #colorLiteral(red: 0.5529411765, green: 0.537254902, blue: 0.537254902, alpha: 1)
    descriptionLabel.font = UIFont(name: "SourceSansPro-Regular", size: 12)
    descriptionLabel.textColor = #colorLiteral(red: 0.5529411765, green: 0.537254902, blue: 0.537254902, alpha: 1)
    posterImageView.layer.cornerRadius = 4
    posterImageView.clipsToBounds = true
    posterImageView.contentMode = .scaleAspectFill
  }
  
  func configure(model: MoviesItem) {
    titleLabel.text = model.title
    posterImageView.loadImage(url: model.imageURL)
    descriptionLabel.text = model.overview
    descriptionLabel.numberOfLines = 2
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: model.releaseDate)
    dateFormatter.dateFormat = "yyyy"
    let year = dateFormatter.string(from: date ?? Date())
    
    NetworkService.shared.getGenreList { (genres, error) in
      if let error = error {
        print(error)
        return
      }
      guard let genres = genres else {return}
      let currntGenres = genres.genres.filter {model.genres.contains($0.id)}.map{$0.name}
      if currntGenres.isEmpty {return}

      DispatchQueue.main.async {
        self.genreLabel.text = "\(currntGenres[0]), \(year)"
      }
    }
  }
  
}
