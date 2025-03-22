//
//  AppCoordinator.swift
//  MVVM-Coordinator Example
//
//  Created by Faiq Khan on 21/03/2025.
//

import UIKit
import SwiftUI
import Combine

class AppCoordinator: Coordinator {
    private var window: UIWindow
    private var childCoordinators = [Coordinator]()
    private var hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    private var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        hasSeenOnboarding.sink { [weak self] hasSeen in
            guard let self = self else { return }
            let coordinator = createChildCoordinator(for: hasSeen)
            coordinator.start()
            self.childCoordinators = [coordinator]
            self.window.rootViewController = coordinator.getRootViewController()
        }.store(in: &subscriptions)
    }
    
    private func createChildCoordinator(for condtion: Bool) -> Coordinator {
        if condtion {
            return MainCoordinator()
        } else {
            return OnboardingCoordinator(self.hasSeenOnboarding)
        }
    }
}
