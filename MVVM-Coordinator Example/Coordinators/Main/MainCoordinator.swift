//
//  MainCoordinator.swift
//  MVVM-Coordinator Example
//
//  Created by Faiq Khan on 21/03/2025.
//

import UIKit

class MainCoordinator: Coordinator {
    var rootViewController = UITabBarController()
    var childCoordinators = [Coordinator]()
    
    init() {
        rootViewController.tabBar.isTranslucent = false
        rootViewController.tabBar.backgroundColor = .white
    }
    
    func start() {
        let firstTabCoordinator = MainFirstTabCoordinator()
        firstTabCoordinator.start()
        childCoordinators.append(firstTabCoordinator)
        let firstViewController = firstTabCoordinator.rootViewController
        firstViewController.tabBarItem = UITabBarItem(title: "First",
                                                      image: UIImage(systemName: "house"),
                                                      selectedImage: UIImage(systemName: "house.fill"))
        
        let secondTabCoordinator = MainSecondTabCoordinator()
        secondTabCoordinator.start()
        childCoordinators.append(secondTabCoordinator)
        let secondViewController = secondTabCoordinator.rootViewController
        secondViewController.tabBarItem = UITabBarItem(title: "Second",
                                                       image: UIImage(systemName: "paperplane"),
                                                       selectedImage: UIImage(systemName: "paperplane.fill"))
        
        rootViewController.viewControllers = [
            firstViewController,
            secondViewController
        ]
    }
    
    func getRootViewController() -> UIViewController {
        return rootViewController
    }
}
