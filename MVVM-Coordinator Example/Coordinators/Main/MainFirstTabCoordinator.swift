//
//  MainFirstTabCoordinator.swift
//  MVVM-Coordinator Example
//
//  Created by Faiq Khan on 21/03/2025.
//

import UIKit

class MainFirstTabCoordinator: Coordinator {
    var rootViewController = UINavigationController()
    let viewModel = MainFirstTabViewModel()
    
    lazy var firstViewController: MainFirstViewController = {
        let vc = MainFirstViewController()
        vc.title = "First"
        vc.viewModel = viewModel
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
}
