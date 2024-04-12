//
//  SceneDelegate.swift
//  homework 16
//
//  Created by vako on 12.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navigationController
        
        
        navigationController.navigationBar.prefersLargeTitles = true
        
        let largeTitle: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.label,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 34)
        ]
        
        navigationController.navigationBar.largeTitleTextAttributes = largeTitle
        return
    }
}
