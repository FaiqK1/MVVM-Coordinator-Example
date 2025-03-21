//
//  OnboardingCoordinator.swift
//  MVVM-Coordinator Example
//
//  Created by Faiq Khan on 21/03/2025.
//

import SwiftUI

class OnboardingCoordinator: Coordinator {
    var rootViewController = UIViewController()
    
    func start() {
        let onboardingView = OnboardingView {
            
        }
        rootViewController = UIHostingController(rootView: onboardingView)
    }
}
