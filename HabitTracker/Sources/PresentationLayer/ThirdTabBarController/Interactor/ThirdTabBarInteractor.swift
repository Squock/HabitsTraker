//
//  ThirdTabBarInteractor.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation

final class ThirdTabBarInteractor {
    private let presenter: ThirdTabBarPresenterProtocol

    init(presenter: ThirdTabBarPresenterProtocol) {
        self.presenter = presenter
    }
}

extension ThirdTabBarInteractor: ThirdTabBarInteractorProtocol {}
