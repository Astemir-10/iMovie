//
//  UIViewController + loadFromStoryboard.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

extension UIViewController {
  class func loadFromStoryboard<T: UIViewController>(storyboardName: String, by id: String) -> T {
    let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
    if let viewController = storyboard.instantiateViewController(identifier: id) as? T {
      return viewController
    } else {
      fatalError("not found storyboard by name \(storyboardName)")
    }
  }
  
  class func loadFromStoryboard<T: UIViewController>() -> T {
    let name = String(describing: T.self)
    let storyboard = UIStoryboard(name: name, bundle: nil)
    if let viewController = storyboard.instantiateInitialViewController() as? T {
      return viewController
    }
    fatalError("not found storyboard by name \(name)")
  }
}
