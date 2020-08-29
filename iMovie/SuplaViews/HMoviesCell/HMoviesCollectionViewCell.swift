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
    filmName.font = UIFont(name: "SourceSansPro-Regular", size: 15)
    filmGenre.font = UIFont(name: "SourceSansPro-Regular", size: 13)
    filmGenre.textColor = #colorLiteral(red: 0.5529411765, green: 0.537254902, blue: 0.537254902, alpha: 1)
    
    raitingLabel.font = UIFont(name: "SourceSansPro-Semibold", size: 13)
    raitingView.layer.cornerRadius = raitingView.frame.height / 2
    raitingView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    raitingView.clipsToBounds = true
    posterImage.layer.cornerRadius = 10
    posterImage.clipsToBounds = true
    posterImage.contentMode = .scaleAspectFill
    raitingLabel.textColor = .white
  }
  
  func configure(model: MoviesItem) {
    raitingLabel.text = String(model.voteAvg)
    posterImage.loadImage(url: model.imageURL)
    filmName.text = model.title
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
        self.filmGenre.text = "\(currntGenres[0]), \(year)"
      }
    }
  }
  
  
  
}
