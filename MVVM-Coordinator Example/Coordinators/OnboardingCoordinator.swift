//
//  OnboardingCoordinator.swift
//  MVVM-Coordinator Example
//
//  Created by Faiq Khan on 21/03/2025.
//

import SwiftUI
import Combine

class OnboardingCoordinator: Coordinator {
    var rootViewController = UIViewController()
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>
    
    init(_ hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    func start() {
        let onboardingView = OnboardingView { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        rootViewController = UIHostingController(rootView: onboardingView)
    }
    
    func getRootViewController() -> UIViewController {
        return rootViewController
    }
}
