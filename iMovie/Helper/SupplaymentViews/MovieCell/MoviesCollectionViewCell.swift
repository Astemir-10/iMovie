//
//  MoviesCollectionViewCell.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

protocol MoviesCellModelProtocol {
  var title: String {get}
  var imageURL: String {get}
  var movieId: Int {get}
  var genres: [Int] {get}
  var releaseDate: String {get}
  var voteAvg: Double {get}
  var overview: String {get}
}

class MoviesCollectionViewCell: UICollectionViewCell {
  static let reuseId = String(describing: MoviesCollectionViewCell.self)
  @IBOutlet weak var posterImage: UIImageView!
  @IBOutlet weak var filmName: UILabel!
  @IBOutlet weak var filmGenre: UILabel!
  @IBOutlet weak var raitingLabel: UILabel!
  @IBOutlet weak var raitingView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    filmName.font = UIFont(name: "SourceSansPro-Regular", size: 14)
    filmGenre.font = UIFont(name: "SourceSansPro-Regular", size: 12)
    filmGenre.adjustsFontSizeToFitWidth = true

    filmName.numberOfLines = 2
    
    posterImage.layer.cornerRadius = 10
    posterImage.clipsToBounds = true
    
    raitingLabel.textColor = .white

    raitingView.layer.cornerRadius = raitingView.frame.height / 2
    raitingView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    raitingView.clipsToBounds = true
    raitingView.backgroundColor = .red
    
    raitingLabel.font = UIFont(name: "SourceSansPro-Semibold", size: 14)
    
    backgroundColor = .white
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    posterImage.image = nil
  }
  
  func configure(_ model: MoviesCellModelProtocol) {
    filmName.text = model.title
    posterImage.loadImage(url: model.imageURL)
    raitingLabel.text = "\(model.voteAvg)"
    print("\(model.movieId) ---- \(model.title)")
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
