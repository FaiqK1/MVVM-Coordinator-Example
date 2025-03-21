//
//  MainSecondTabCoordinator.swift
//  MVVM-Coordinator Example
//
//  Created by Faiq Khan on 21/03/2025.
//

import UIKit

class MainSecondTabCoordinator: Coordinator {
    var rootViewController = UINavigationController()
    
    lazy var secondViewController = {
        let vc = MainSecondViewController()
        vc.title = "Second"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
