//
//  MainHeaderView.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 29.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

protocol MainHeaderViewDelegate: class {
  func didTapYet(sectionindex: Int)
}

class MainHeaderView: UICollectionReusableView {
  
  static let reuseId = String(describing: MainHeaderView.self)
  var sectionNumber: Int?
  let titleLabel = UILabel()
  let button = UIButton(type: .system)
  

  weak var delegate: MainHeaderViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = UIFont(name: "SourceSansPro-Semibold", size: 18)
    button.setTitle("Еще", for: .normal)
    button.titleLabel?.font = UIFont(name: "SourceSansPro-Regular", size: 14)
    button.titleLabel?.textColor = .black
    button.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(titleLabel)
    addSubview(button)
    NSLayoutConstraint.activate([titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                                 button.heightAnchor.constraint(equalToConstant: 28),
                                 button.widthAnchor.constraint(equalToConstant: 30),
                                 button.centerYAnchor.constraint(equalTo: centerYAnchor),
                                 button.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -32)])
    button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
  }
  
  @objc private func tapButton() {
    guard let delegate = delegate, let sectionNumber = sectionNumber else {return}
    delegate.didTapYet(sectionindex: sectionNumber)
  }
  

}
