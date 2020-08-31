//
//  UI.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 31.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

extension DetailContentView {
  
  func initUI() {
    setupUIElements()
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    layout.scrollDirection = .horizontal
    collectionView.delegate = self
    collectionView.dataSource = self
    let nib = UINib(nibName: MoviesCollectionViewCell.reuseId, bundle: nil)
    collectionView.register(nib.self, forCellWithReuseIdentifier: MoviesCollectionViewCell.reuseId)
    collectionView.backgroundColor = .white
  }
  
  // Setup UIElements
  func setupUIElements() {
    translatesAutoresizingMaskIntoConstraints = false
    titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = UIFont(name: "SourceSansPro-Semibold", size: 27)

    
    
    titleOriginalLabel = UILabel()
    titleOriginalLabel.translatesAutoresizingMaskIntoConstraints = false
    titleOriginalLabel.font = UIFont(name: "SourceSansPro-Regular", size: 19)
    

    studioNameLabel = UILabel()
    studioNameLabel.translatesAutoresizingMaskIntoConstraints = false
    studioNameLabel.font = UIFont(name: "SourceSansPro-Regular", size: 17)
    

    taglineLabel = UILabel()
    taglineLabel.translatesAutoresizingMaskIntoConstraints = false
    taglineLabel.font = UIFont(name: "SourceSansPro-It", size: 16)
    


    genresLabel = UILabel()
    genresLabel.translatesAutoresizingMaskIntoConstraints = false
    genresLabel.font = UIFont(name: "SourceSansPro-Regular", size: 16)
    genresLabel.textColor = #colorLiteral(red: 0.568627451, green: 0.568627451, blue: 0.568627451, alpha: 1)
    

    dateCountryTimeLabel = UILabel()
    dateCountryTimeLabel.translatesAutoresizingMaskIntoConstraints = false
    dateCountryTimeLabel.font = UIFont(name: "SourceSansPro-Regular", size: 16)
    dateCountryTimeLabel.textColor = #colorLiteral(red: 0.568627451, green: 0.568627451, blue: 0.568627451, alpha: 1)
    

    raitingLabel = UILabel()
    raitingLabel.tag = 1
    raitingLabel.translatesAutoresizingMaskIntoConstraints = false
    raitingLabel.font = UIFont(name: "SourceSansPro-Semibold", size: 21)
    raitingLabel.backgroundColor = #colorLiteral(red: 0.5568627451, green: 0.4588235294, blue: 0.968627451, alpha: 1)
    raitingLabel.layer.cornerRadius = 20
    raitingLabel.clipsToBounds = true
    raitingLabel.textAlignment = .center
    raitingLabel.textColor = .white
    


    watchButton = UIButton()
    watchButton.setTitle("Смотерть", for: .normal)
    watchButton.translatesAutoresizingMaskIntoConstraints = false
   

    overviewLabel = UILabel()
    overviewLabel.translatesAutoresizingMaskIntoConstraints = false
    overviewLabel.font = UIFont(name: "SourceSansPro-It", size: 16)
    overviewLabel.numberOfLines = 0
    
  }
  
  // Set layout constraints for ui elements
  func layoutsUI() {
    addSubview(titleLabel)
    titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    addViewAnchor(direction: .horizontal, in: titleLabel, constantLeading: 8, constantTrailing: -8)
    
    addSubview(titleOriginalLabel)
    titleOriginalLabel.addViewAnchor(by: .bottom, to: titleLabel, constant: 8)
    addViewAnchor(direction: .horizontal, in: titleOriginalLabel, constantLeading: 8, constantTrailing: -8)
    
    addSubview(studioNameLabel)
    addViewAnchor(direction: .horizontal, in: studioNameLabel, constantLeading: 8, constantTrailing: -8)
    studioNameLabel.addViewAnchor(by: .bottom, to: titleOriginalLabel)
    
    addSubview(taglineLabel)
    addViewAnchor(direction: .horizontal, in: taglineLabel, constantLeading: 8, constantTrailing: -8)
    taglineLabel.addViewAnchor(by: .bottom, to: studioNameLabel, constant: 8)
    
    addSubview(genresLabel)
    addViewAnchor(direction: .horizontal, in: genresLabel, constantLeading: 8, constantTrailing: -8)
    genresLabel.addViewAnchor(by: .bottom, to: taglineLabel, constant: 8)
    
    addSubview(dateCountryTimeLabel)
    addViewAnchor(direction: .horizontal, in: dateCountryTimeLabel, constantLeading: 8, constantTrailing: -8)
    dateCountryTimeLabel.addViewAnchor(by: .bottom, to: genresLabel, constant: 2)
    
    addSubview(raitingLabel)
    raitingLabel.addViewAnchor(by: .bottom, to: dateCountryTimeLabel, constant: 10)
    
    addSubview(watchButton)
       watchButton.backgroundColor = #colorLiteral(red: 1, green: 0.6588235294, blue: 0.3411764706, alpha: 1)
    watchButton.layer.cornerRadius = 20
    watchButton.clipsToBounds = true
    watchButton.titleLabel?.font = UIFont(name: "SourceSansPro-Regular", size: 20)
    
    var controlSize = CGSize(width: 40, height: 40)
    raitingLabel.setSizeAnchor(size: controlSize)
    controlSize.width = 0
    watchButton.setSizeAnchor(size: controlSize)

    NSLayoutConstraint
      .activate([raitingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                                 watchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                                 watchButton.centerYAnchor.constraint(equalTo: raitingLabel.centerYAnchor),
                                 watchButton.leadingAnchor.constraint(equalTo: raitingLabel.trailingAnchor, constant: 20)])
    addSubview(overviewLabel)
    addViewAnchor(direction: .horizontal, in: overviewLabel, constantLeading: 8, constantTrailing: -8)
    overviewLabel.addViewAnchor(by: .bottom, to: raitingLabel, constant: 10)
    
    let headerLabel = UILabel()
    addSubview(headerLabel)
    headerLabel.text = "Похожие"
    headerLabel.translatesAutoresizingMaskIntoConstraints = false
    addViewAnchor(direction: .horizontal, in: headerLabel, constantLeading: 8, constantTrailing: -8)
    headerLabel.addViewAnchor(by: .bottom, to: overviewLabel, constant: 8)
    headerLabel.font = UIFont(name: "SourceSansPro-Semibold", size: 21)
    headerLabel.sizeToFit()

    collectionView.translatesAutoresizingMaskIntoConstraints = false
    addViewAnchor(direction: .horizontal, in: collectionView)
    collectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive = true
  }
  
}

