//
//  DetailViewController + Constraints.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 31.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

extension DetailViewController {
  
  
  func scrollViewSetup() {
    scrolView.translatesAutoresizingMaskIntoConstraints = false
    scrolView.contentSize = CGSize(width: 375, height: 1200)
    view.addSubview(scrolView)
    scrolView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    scrolView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    scrolView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    scrolView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    scrolView.contentLayoutGuide.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    scrolView.addSubview(contentView)
  }
  
  
  func setupCollectionView() {
    imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 350))
    imageView.image = #imageLiteral(resourceName: "devergent")
    view.addSubview(imageView)
  }
  
  func detailContent() {
    
    
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.leadingAnchor.constraint(equalTo: scrolView.contentLayoutGuide.leadingAnchor).isActive = true
    contentView.trailingAnchor.constraint(equalTo: scrolView.contentLayoutGuide.trailingAnchor).isActive = true
    contentView.topAnchor.constraint(equalTo: scrolView.contentLayoutGuide.topAnchor,constant: 350).isActive = true
    detailContentUI()
  }
  
  func detailContentUI() {
    contentView = DetailContentView(frame:  .zero, model: model)
    
    
    
  }

  
}
