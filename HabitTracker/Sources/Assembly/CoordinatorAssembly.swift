//
//  CoordinatorAssembly.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation
import Swinject

final class CoordinatorAssembly: Assembly {
    let sceneFactory: SceneFactory

    init() {
        sceneFactory = SceneFactory()
    }

    /*private func registerMainCoordinator(container: Container) {
        container.register(MainCoordinator.self) { resolver in
            let coordinator = MainCoordinator(sceneFactory: self.sceneFactory)
            return coordinator
        }.inObjectScope(.container)
    }*/

    func assemble(container: Container) {
        //registerMainCoordinator(container: container)
    }
}
