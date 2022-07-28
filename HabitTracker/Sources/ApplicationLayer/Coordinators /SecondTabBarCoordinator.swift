//
//  SecondTabBarController.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation

final class SecondTabBarCoordinator: Coordinator {
    private let sceneFactory: SceneFactoryProtocol

    init(sceneFactory: SceneFactoryProtocol) {
        self.sceneFactory = sceneFactory
    }

    func start() {}
}
