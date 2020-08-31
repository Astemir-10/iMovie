//
//  DetailViewController.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 29.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

struct Model: DetailModelProtocol {
  
  var title: String
  
  var titleOriginal: String
  
  var studioName: String
  
  var tagline: String
  
  var geners: [String]
  
  var releaseDate: String
  
  var country: String
  
  var time: Int
  
  var raiting: Double
  
  var overview: String
  
  
}

class DetailViewController: UIViewController {
  let model = Model(title: "Мстители", titleOriginal: "Avengers: Infinity War", studioName: "Marvel", tagline: "Целая вселенная раз и навсегда", geners: ["Триллер", "Ужасы"], releaseDate: "2020", country: "США", time: 141, raiting: 8.5, overview: "Пока Мстители и их союзники продолжают защищать мир от различных опасностей, с которыми не смог бы справиться один супергерой, новая угроза возникает из космоса: Танос. Межгалактический тиран…")
  
  var animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear)
  var imageView: UIImageView!
  let scrolView = UIScrollView(frame: .zero)
  var contentView: DetailContentView!
  var collectionView: UICollectionView!
  var pastOffset: [CGFloat] = []
  var configurator: DetailConfiguratorType = DetailConfigurator()
  var presenter: DetailPresenterType!
  
  init(movieId: Int) {
    super.init(nibName: nil, bundle: nil)
    configurator.configure(viewController: self)
    presenter.configureView(movieId: movieId)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
      
    view.backgroundColor = .red
    setupCollectionView()
    detailContentUI()
    scrollViewSetup()
    imageView.image = #imageLiteral(resourceName: "devergent")
    scrolView.backgroundColor = .clear
    scrolView.delegate = self
    imageView.contentMode = .scaleAspectFill
    self.navigationController?.navigationBar.alpha = 0
    animator.addAnimations {
      self.imageView.alpha = 0
      self.navigationController?.navigationBar.alpha = 1
    }
    contentView.delegate = self
    detailContent()
    view.backgroundColor = .white
    title = "Подробности"
    navigationItem.hidesSearchBarWhenScrolling = true
  }
}


extension DetailViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let y = 350 - (scrollView.contentOffset.y + 10)
    let height = min(max(y, 10), 550)
    
    pastOffset.append(scrollView.contentOffset.y)
    
    if scrollView.contentOffset.y < -20 {
      imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
    if  self.scrolView.contentOffset.y < 250 {
      animator.fractionComplete = 1 - abs((scrollView.contentOffset.y / 250) - 1)
      navigationController?.navigationBar.alpha = 1 - abs((scrollView.contentOffset.y / 250) - 1)
    }
  }
}

extension DetailViewController: DetailContentViewDelegate {
  func setSize(height: CGFloat) {
    if height > 250 {
    scrolView.contentLayoutGuide.heightAnchor.constraint(equalToConstant: height + imageView.frame.height - 100).isActive = true
    }

  }
}


extension DetailViewController: DetailViewProtocol {
  
}
