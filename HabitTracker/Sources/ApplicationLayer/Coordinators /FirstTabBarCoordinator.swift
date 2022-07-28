//
//  FirstTabBarController.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation
import UIKit

protocol FirstTabBarCoordinatorDelegate: AnyObject {
    func addButtonTapped()
    func achieveTapped()
}

final class FirstTabBarCoordinator: Coordinator {
    private let sceneFactory: SceneFactoryProtocol
    private let navigationController: UINavigationController

    init(sceneFactory: SceneFactoryProtocol,
         navigationController: UINavigationController) {
        self.sceneFactory = sceneFactory
        self.navigationController = navigationController
    }

    func start() {
        let firstTabBarViewController = sceneFactory.makeFirstTabBarViewController()
        let firstTabBarInteractor = firstTabBarViewController.interactor as? FirstTabBarInteractor
        firstTabBarInteractor?.coordinatorDelegate = self
        navigationController.viewControllers = [firstTabBarViewController]
    }

    private func showScene(viewController: UIViewController,
                           isPresent: Bool,
                           isPush: Bool) {
        if isPresent {
            navigationController.present(viewController, animated: true)
            return
        }
        if isPush {
            navigationController.pushViewController(viewController, animated: true)
            return
        }
    }
}

extension FirstTabBarCoordinator: FirstTabBarCoordinatorDelegate {
    func addButtonTapped() {
        let habitsViewController = sceneFactory.makeHabitsViewController()
        showScene(viewController: habitsViewController, isPresent: true, isPush: false)
    }

    func achieveTapped() {
        // Пока просто отображение пустого вью контроллера
        let habitsViewController = sceneFactory.makeHabitsViewController()
        showScene(viewController: habitsViewController, isPresent: false, isPush: true)
    }
}
