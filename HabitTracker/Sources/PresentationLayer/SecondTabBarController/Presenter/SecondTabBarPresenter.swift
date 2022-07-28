//
//  SecondTabBarPresenter.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation

final class SecondTabBarPresenter {
    private let viewController: SecondTabBarViewControllerProtocol

    init(viewController: SecondTabBarViewControllerProtocol) {
        self.viewController = viewController
    }
}

extension SecondTabBarPresenter: SecondTabBarPresenterProtocol {}
