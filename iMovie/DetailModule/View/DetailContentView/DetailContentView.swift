//
//  DetailContentView.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 31.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

protocol DetailContentViewDelegate: class {
  func setSize(height: CGFloat)
}

class DetailContentView: UIView {
  private var height: CGFloat!
  private var model: DetailModelProtocol!
  
  var titleLabel: UILabel!
  var titleOriginalLabel: UILabel!
  var studioNameLabel: UILabel!
  var taglineLabel: UILabel!
  var genresLabel: UILabel!
  var dateCountryTimeLabel: UILabel!
  var raitingLabel: UILabel!
  var watchButton: UIButton!
  var overviewLabel: UILabel!
  
  var collectionView: UICollectionView!
  
  weak var delegate: DetailContentViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUIElements()
  }
  
  init(frame: CGRect, model: DetailModelProtocol) {
    super.init(frame: frame)
    self.model = model
    initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    backgroundColor = .clear
    layer.cornerRadius = 15
    layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    let blurEffect = UIBlurEffect(style: .light)
    let visualEffect = UIVisualEffectView(effect: blurEffect)
    visualEffect.frame = bounds
    
    addSubview(visualEffect)
    clipsToBounds = true
    addSubview(collectionView)
    calculateHeight(model: model)
    layoutsUI()
    collectionViewUI()
    height = self.frame.height
    delegate?.setSize(height: height + 100)
  }
  
  func collectionViewUI() {
    collectionView.backgroundColor = .clear
  }

  func calculateHeight(model: DetailModelProtocol) {
    // Добавляем высоту отдельно для raitingLabel так как высота фиксированная
    height = 0
    height += 40
    calculateHeight(label: titleLabel, data: model.title)
    calculateHeight(label: titleOriginalLabel, data: model.titleOriginal)
    calculateHeight(label: studioNameLabel, data: model.studioName)
    calculateHeight(label: taglineLabel, data: model.tagline)
    var genre = ""
    model.geners.forEach {genre += "\($0) · "}
    genre.removeLast()
    genre.removeLast()
    calculateHeight(label: genresLabel, data: genre)

    var dateCountryTime = ""
    dateCountryTime += model.releaseDate != "" ? "\(model.releaseDate) · ": ""
    dateCountryTime += model.country != "" ? "\(model.country) · ": ""
    var time = ""
    let hours = String(model.time / 60)
    let minutes = String(model.time % 60)
    time = "\(hours)ч \(minutes)мин"
    dateCountryTime += model.time != 0 ? "\(time)": ""
    if time == "" {
      dateCountryTime.removeLast()
      dateCountryTime.removeLast()
    }
    calculateHeight(label: dateCountryTimeLabel, data: dateCountryTime)
    calculateHeight(label: raitingLabel, data: String(model.raiting))
    calculateHeight(label: overviewLabel, data: model.overview)
    height += 8
  }
  
  fileprivate func calculateHeight(label: UILabel, data: String) {
    if label.tag != 1 {
      label.sizeToFit()
    }
    label.text = data
    label.numberOfLines = 0
    height += label.frame.height
    height += label.frame.height > 0 ? 8 : 0
  }
}

extension DetailContentView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionViewCell.reuseId, for: indexPath) as! MoviesCollectionViewCell
    cell.posterImage.image = #imageLiteral(resourceName: "devergent")
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 141, height: 246)
  }
  
}
