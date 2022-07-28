//
//  SecondTabBarViewController.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import UIKit

class SecondTabBarViewController: UIViewController {
    var interactor: SecondTabBarInteractorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension SecondTabBarViewController: SecondTabBarViewControllerProtocol {}
