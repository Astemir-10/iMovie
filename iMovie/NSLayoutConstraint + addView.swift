//
//  NSLayoutConstraint + addView.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 31.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit


//class a: UIViewController {
//  override func viewDidLoad() {
//    let view = UIView()
//    let someView = UIView()
//    view.addViewAnchor(by: .bottom, to: someView, c)
//  }
//}
extension UIView {
  func addViewAnchor(by: Anchors, to view: UIView, constant: CGFloat? = 0) {
    switch by {
    case .top:
      NSLayoutConstraint.activate([self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant ?? 0)])
    case .bottom:
       NSLayoutConstraint.activate([self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant ?? 0)])
    case .leading:
       NSLayoutConstraint.activate([self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant ?? 0)])
    case .trailing:
      NSLayoutConstraint.activate([self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant ?? 0)])
    }
  }
  
  func addViewAnchor(direction: DirectionAnchor, in view: UIView, constantLeading: CGFloat? = 0, constantTrailing: CGFloat? = 0, constantBottom: CGFloat? = 0, constantTop: CGFloat? = 0) {
    
    let leadingAnch = view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constantLeading ?? 0)
    let topAnch = view.topAnchor.constraint(equalTo: self.topAnchor, constant: constantTop ?? 0)
    let bottomAnch = view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: constantBottom ?? 0)
    let trailingAnch = view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: constantTrailing ?? 0)
    
    switch direction {
    case .horizontal:
      leadingAnch.isActive = true
      trailingAnch.isActive = true
    case .vertical:
      topAnch.isActive = true
      bottomAnch.isActive = true
    case .full:
      topAnch.isActive = true
      bottomAnch.isActive = true
      leadingAnch.isActive = true
      trailingAnch.isActive = true
    }
    
  
  }
  
  enum Anchors {
    case top, bottom, leading, trailing
  }
  
  enum DirectionAnchor {
    case horizontal, vertical, full
  }
  
  
}
