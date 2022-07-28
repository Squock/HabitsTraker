//
//  CoordinatorFactory.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation
import UIKit

final class CoordinatorFactory {
    private let sceneFactory: SceneFactoryProtocol
    private let window: UIWindow?

    init(sceneFactory: SceneFactoryProtocol, window: UIWindow?) {
        self.sceneFactory = sceneFactory
        self.window = window
    }
}

// MARK: Root Coordinator
extension CoordinatorFactory: CoordinatorFactoryProtocol {
    func makeFirstTabCoordinator(_ navigationController: UINavigationController) -> FirstTabBarCoordinator {
        return FirstTabBarCoordinator(sceneFactory: sceneFactory, navigationController: navigationController)
    }
    
    func makeSecondTabCoordinator(_ navigationController: UINavigationController) -> SecondTabBarCoordinator {
        return SecondTabBarCoordinator(sceneFactory: sceneFactory, navigationController: navigationController)
    }
    
    func makeThirdTabCoordinator(_ navigationController: UINavigationController) -> ThirdTabBarCoordinator {
        return ThirdTabBarCoordinator(sceneFactory: sceneFactory, navigationController: navigationController)
    }
    
    func makeRootCoordinator() -> MainCoordinator {
        return MainCoordinator(sceneFactory: sceneFactory, coordinatorFactory: self, window: window)
    }
}
