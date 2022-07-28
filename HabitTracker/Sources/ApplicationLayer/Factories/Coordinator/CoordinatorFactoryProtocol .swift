//
//  CoordinatorFactoryProtocol .swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation
import UIKit

protocol CoordinatorFactoryProtocol: AnyObject {
    func makeRootCoordinator() -> MainCoordinator
    func makeFirstTabCoordinator(_ navigationController: UINavigationController) -> FirstTabBarCoordinator
    func makeSecondTabCoordinator(_ navigationController: UINavigationController) -> SecondTabBarCoordinator
    func makeThirdTabCoordinator(_ navigationController: UINavigationController) -> ThirdTabBarCoordinator
}
