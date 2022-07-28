//
//  ThirdTabBarController.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation
import UIKit

final class ThirdTabBarCoordinator: Coordinator {
    private let sceneFactory: SceneFactoryProtocol
    private let navigationController: UINavigationController

    init(sceneFactory: SceneFactoryProtocol,
         navigationController: UINavigationController) {
        self.sceneFactory = sceneFactory
        self.navigationController = navigationController
    }

    func start() {
        let viewController = sceneFactory.makeThirdTabBarViewController()
        navigationController.viewControllers = [viewController]
    }
}
