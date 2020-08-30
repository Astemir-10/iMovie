//
//  DetailContentView.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 31.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit
protocol DetailModelProtocol {
  var title: String {get}
  var titleOriginal: String {get}
  var tagline: String {get}
  var geners: [String] {get}
  var releaseDate: String {get}
  var country: String {get}
  var time: String {get}
  var raiting: Int {get}
  var overview: String {get}
}

class DetailContentView: UIView {
  var model: DetailModelProtocol!
  var height: CGFloat!
  
  var titleLabel: UILabel!
  var titleOriginalLabel: UILabel!
  var studioNameLabel: UILabel!
  var taglineLabel: UILabel!
  var genersLabel: UILabel!
  var dateCountryTimeLabel: UILabel!
  var raitingLabel: UILabel!
  var watchButton: UIButton!
  var overviewLabel: UILabel!
  
  var recomendationsCollectionView: UICollectionView!
  var similarCollectionView: UICollectionView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  init(frame: CGRect, model: DetailModelProtocol) {
    super.init(frame: frame)
    self.model = model
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func draw(_ rect: CGRect) {
    calculateHeight(model: model)
    let rect = CGRect(origin: rect.origin, size: CGSize(width: rect.width, height: height))
    super.draw(rect)
    
  }
  
  fileprivate func calculateHeight(model: DetailModelProtocol) {
    
  }
  
  fileprivate func setupUI() {
    
  }
}
