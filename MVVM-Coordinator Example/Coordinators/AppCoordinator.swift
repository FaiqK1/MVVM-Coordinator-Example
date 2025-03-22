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
    var window: UIWindow
    var childCoordinators = [Coordinator]()
    var hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        hasSeenOnboarding.sink { [weak self] hasSeen in
            guard let self = self else { return }
            let coordinator = self.createCoordinator(for: hasSeen)
            coordinator.start()
            self.childCoordinators = [coordinator]
            self.window.rootViewController = coordinator.getRootViewController()
        }.store(in: &subscriptions)
    }
    
    private func createCoordinator(for hasSeenOnboarding: Bool) -> Coordinator {
        if hasSeenOnboarding {
            return MainCoordinator()
        } else {
            return OnboardingCoordinator(self.hasSeenOnboarding)
        }
    }
}
