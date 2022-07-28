//
//  SceneFactory.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation
import UIKit

final class SceneFactory {}

extension SceneFactory: MainSceneFactoryProtocol {
    func makeRootTabBar() -> MainTabBarController {
        return MainTabBarController()
    }
}
