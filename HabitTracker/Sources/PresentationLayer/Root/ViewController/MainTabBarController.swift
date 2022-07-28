//
//  MainTabBarController.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    var interactor: MainTabBarInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
    }
}

extension MainTabBarController: MainTabBarControllerProtocol {}
