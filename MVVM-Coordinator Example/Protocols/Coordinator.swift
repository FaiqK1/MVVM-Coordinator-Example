//
//  Coordinator.swift
//  MVVM-Coordinator Example
//
//  Created by Faiq Khan on 21/03/2025.
//

import UIKit

protocol Coordinator {
    func start()
    func getRootViewController() -> UIViewController
}

extension Coordinator {
    func getRootViewController() -> UIViewController {
        return UIViewController()
    }
}
