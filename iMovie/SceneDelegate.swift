//
//  SceneDelegate.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

    guard let scene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: scene)
    let rootViewController: UINavigationController = UINavigationController.loadFromStoryboard(storyboardName: "MoviesViewController", by: "moviesNavigation")
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
  }
}

