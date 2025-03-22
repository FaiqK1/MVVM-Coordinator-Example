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
    private var hasSeenOnboardingKey = "hasSeenOnboarding"
    private var hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    private var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
        determineHasSeenOnboarding()
    }
    
    func start() {
        hasSeenOnboarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
                guard let self = self else { return }
                if hasSeen {
                    saveHasSeenOnboardingIfNeeded()
                }
                let coordinator = createChildCoordinator(for: hasSeen)
                coordinator.start()
                childCoordinators = [coordinator]
                window.rootViewController = coordinator.getRootViewController()
            }
            .store(in: &subscriptions)
    }
    
    private func createChildCoordinator(for condtion: Bool) -> Coordinator {
        if condtion {
            return MainCoordinator()
        } else {
            return OnboardingCoordinator(self.hasSeenOnboarding)
        }
    }
    
    private func determineHasSeenOnboarding() {
        let value = UserDefaults.standard.bool(forKey: hasSeenOnboardingKey)
        hasSeenOnboarding.send(value)
    }
    
    private func saveHasSeenOnboardingIfNeeded() {
        guard UserDefaults.standard.object(forKey: hasSeenOnboardingKey) == nil else {
            return
        }
        UserDefaults.standard.setValue(true, forKey: hasSeenOnboardingKey)
    }
}
