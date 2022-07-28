//
//  MainCoordinator.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    private let sceneFactory: SceneFactoryProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let tabBarController: MainTabBarController
    private let window: UIWindow?
    private let firstNavigationController: UINavigationController
    private let secondNavigationController: UINavigationController
    private let thirdNavigationController: UINavigationController

    init(sceneFactory: SceneFactoryProtocol,
         coordinatorFactory: CoordinatorFactoryProtocol,
         window: UIWindow?) {
        self.sceneFactory = sceneFactory
        self.coordinatorFactory = coordinatorFactory
        self.window = window
        tabBarController = sceneFactory.makeRootTabBar()
        window?.rootViewController = tabBarController
        firstNavigationController = sceneFactory.makeNavigationController()
        secondNavigationController = sceneFactory.makeNavigationController()
        thirdNavigationController = sceneFactory.makeNavigationController()
        tabBarController.viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController]
        firstNavigationController.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(named: "iconHabit"), tag: 0)
        secondNavigationController.tabBarItem = UITabBarItem(title: "Статистика", image: UIImage(named: "iconStatistic"), tag: 1)
        thirdNavigationController.tabBarItem = UITabBarItem(title: "Настройки", image: UIImage(named: "iconSettings"), tag: 2)
    }

    func start() {
        let firstTabCoordinator = coordinatorFactory.makeFirstTabCoordinator(firstNavigationController)
        let secondTabCoordinator = coordinatorFactory.makeSecondTabCoordinator(secondNavigationController)
        let thirdTabCoordinator = coordinatorFactory.makeThirdTabCoordinator(thirdNavigationController)
        firstTabCoordinator.start()
        secondTabCoordinator.start()
        thirdTabCoordinator.start()
    }
}
