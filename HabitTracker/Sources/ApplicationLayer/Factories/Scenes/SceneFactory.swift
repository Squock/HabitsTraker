//
//  SceneFactory.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation
import UIKit

final class SceneFactory {}

// MARK: Create view controllers
extension SceneFactory: SceneFactoryProtocol {
    func makeRootTabBar() -> MainTabBarController {
        let viewController = MainTabBarController()
        let presenter = MainTabBarPresenter(viewController: viewController)
        let interactor = MainTabBarInteractor(presenter: presenter)
        viewController.interactor = interactor
        return viewController
    }

    func makeNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.backgroundColor = .white
        return navigationController
    }

    func makeFirstTabBarViewController() -> FirstTabBarViewController {
        let viewController = FirstTabBarViewController()
        let calendarService = CalendarService()
        let dateService = DateService()
        let presenter = FirstTabBarPresenter(viewController: viewController,
                                             calendarService: calendarService,
                                             dateService: dateService)
        let interactor = FirstTabBarInteractor(presenter: presenter)
        viewController.interactor = interactor
        return viewController
    }
    
    func makeSecondTabBarViewController() -> SecondTabBarViewController {
        let viewController = SecondTabBarViewController()
        let presenter = SecondTabBarPresenter(viewController: viewController)
        let interactor = SecondTabBarInteractor(presenter: presenter)
        viewController.interactor = interactor
        return viewController
    }
    
    func makeThirdTabBarViewController() -> ThirdTabBarViewController {
        let viewController = ThirdTabBarViewController()
        let presenter = ThirdTabBarPresenter(viewController: viewController)
        let interactor = ThirdTabBarInteractor(presenter: presenter)
        viewController.interactor = interactor
        return viewController
    }

    func makeHabitsViewController() -> HabitsViewController {
        let viewController = HabitsViewController()
        let presenter = HabitsPresenter(viewController: viewController)
        let interactor = HabitsInteractor(presenter: presenter)
        viewController.interactor = interactor
        return viewController
    }
}
