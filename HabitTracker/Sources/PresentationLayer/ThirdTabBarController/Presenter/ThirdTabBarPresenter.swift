//
//  ThirdTabBarPresenter.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation

final class ThirdTabBarPresenter {
    private let viewController: ThirdTabBarViewControllerProtocol

    init(viewController: ThirdTabBarViewControllerProtocol) {
        self.viewController = viewController
    }
}

extension ThirdTabBarPresenter: ThirdTabBarPresenterProtocol {}
