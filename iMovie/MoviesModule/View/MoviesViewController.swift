//
//  MoviesViewController.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, MoviesViewProtocol {
  
  var presenter: MoviesPresenterProtocol!
  let congigurator: MoviesConfiguratorProtocol = MoviesConfigurator()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    congigurator.configure(with: self)
    presenter.configureView()
  }
  
}
