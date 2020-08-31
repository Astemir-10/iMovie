//
//  TabBarController.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 29.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    // Do any additional setup after loading the view.
  }
  fileprivate func setup() {
    tabBar.tintColor = #colorLiteral(red: 1, green: 0.5019607843, blue: 0.03137254902, alpha: 1)
    tabBar.unselectedItemTintColor = #colorLiteral(red: 0.435012579, green: 0.437030375, blue: 0.4419462681, alpha: 1)
    let mainVC: UINavigationController = UINavigationController.loadFromStoryboard(storyboardName: "MoviesViewController", by: "moviesNavigation")
    let item = UITabBarItem(title: "", image: #imageLiteral(resourceName: "HomeTab"), tag: 0)
    item.selectedImage = #imageLiteral(resourceName: "HomeTab")
    mainVC.tabBarItem = item
    
    let secondVC = UIViewController()
    secondVC.tabBarItem = UITabBarItem(title: "Коллекция", image: #imageLiteral(resourceName: "Collection"), selectedImage: nil)
    secondVC.view.backgroundColor = .white
    let thirdVC = UINavigationController(rootViewController: DetailViewController(movieId: 27746))
    thirdVC.view.backgroundColor = .white
    thirdVC.tabBarItem = UITabBarItem(title: "Найти", image: #imageLiteral(resourceName: "search"), selectedImage: nil)
    let fourthVC = UIViewController()
    fourthVC.tabBarItem = UITabBarItem(title: "Пользователь", image: #imageLiteral(resourceName: "user"), selectedImage: nil)
    fourthVC.view.backgroundColor = .white
    viewControllers = [mainVC, secondVC, thirdVC, fourthVC]
  }
}
