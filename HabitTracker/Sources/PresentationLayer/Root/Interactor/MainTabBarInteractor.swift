//
//  MainTabBarInteractor.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation

final class MainTabBarInteractor: MainTabBarInteractorProtocol {
    private let presenter: MainTabBarPresenterProtocol

    init(presenter: MainTabBarPresenterProtocol) {
        self.presenter = presenter
    }
}
