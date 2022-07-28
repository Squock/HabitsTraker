//
//  MainSceneFactoryProtocol.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation

protocol SceneFactoryProtocol: AnyObject {
    func makeRootTabBar() -> MainTabBarController
}
