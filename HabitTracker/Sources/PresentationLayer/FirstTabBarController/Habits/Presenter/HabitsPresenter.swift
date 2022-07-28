//
//  HabitsPresenter.swift
//  HabitTracker
//
//  Created by Rodion on 28.07.2022.
//

import Foundation

final class HabitsPresenter {
    private let viewController: HabitsViewControllerProtocol

    init(viewController: HabitsViewControllerProtocol) {
        self.viewController = viewController
    }
}

extension HabitsPresenter: HabitsPresenterProtocol {}
