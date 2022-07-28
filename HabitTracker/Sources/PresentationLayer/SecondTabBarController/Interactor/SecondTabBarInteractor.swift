//
//  SecondTabBarInteractor.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation

final class SecondTabBarInteractor {
    private let presenter: SecondTabBarPresenterProtocol

    init(presenter: SecondTabBarPresenterProtocol) {
        self.presenter = presenter
    }
}

extension SecondTabBarInteractor: SecondTabBarInteractorProtocol {}
