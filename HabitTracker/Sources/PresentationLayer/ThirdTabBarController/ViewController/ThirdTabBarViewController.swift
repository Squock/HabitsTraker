//
//  ThirdTabBarViewController.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import UIKit

class ThirdTabBarViewController: UIViewController {
    var interactor: ThirdTabBarInteractorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension ThirdTabBarViewController: ThirdTabBarViewControllerProtocol {}
