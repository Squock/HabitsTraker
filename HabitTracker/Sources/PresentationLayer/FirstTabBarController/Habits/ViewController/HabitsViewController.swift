//
//  HabitsViewController.swift
//  HabitTracker
//
//  Created by Rodion on 28.07.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    var interactor: HabitsInteractorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
}

extension HabitsViewController: HabitsViewControllerProtocol {}
