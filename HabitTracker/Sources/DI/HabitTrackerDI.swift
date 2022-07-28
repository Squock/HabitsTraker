//
//  HabitTrackerDI.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation
import Swinject

final class HabitTrackerDI {
    let assembler: Assembler
    let coordinatorFactory: CoordinatorFactoryProtocol
    let sceneFactory: SceneFactoryProtocol

    init(window: UIWindow?) {
        let assemblies: [Assembly] = [CoordinatorAssembly()]
        assembler = Assembler(assemblies)
        sceneFactory = SceneFactory()
        coordinatorFactory = CoordinatorFactory(sceneFactory: sceneFactory, window: window)
    }
}
