//
//  MainTabBarPresenter.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation

final class MainTabBarPresenter: MainTabBarPresenterProtocol {
    private let viewController: MainTabBarControllerProtocol

    init(viewController: MainTabBarControllerProtocol) {
        self.viewController = viewController
    }
}
