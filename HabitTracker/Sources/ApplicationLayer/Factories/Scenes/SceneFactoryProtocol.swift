//
//  MainSceneFactoryProtocol.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation
import UIKit

protocol SceneFactoryProtocol: AnyObject {
    func makeRootTabBar() -> MainTabBarController
    func makeNavigationController() -> UINavigationController
    func makeFirstTabBarViewController() -> FirstTabBarViewController
    func makeSecondTabBarViewController() -> SecondTabBarViewController
    func makeThirdTabBarViewController() -> ThirdTabBarViewController
    func makeHabitsViewController() -> HabitsViewController
}
