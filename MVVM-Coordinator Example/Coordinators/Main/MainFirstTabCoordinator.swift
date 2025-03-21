//
//  MainFirstTabCoordinator.swift
//  MVVM-Coordinator Example
//
//  Created by Faiq Khan on 21/03/2025.
//

import UIKit

class MainFirstTabCoordinator: Coordinator {
    var rootViewController = UINavigationController()
    
    lazy var firstViewController: MainFirstViewController = {
        let vc = MainFirstViewController()
        vc.title = "First"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
}
