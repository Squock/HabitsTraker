//
//  FirstTabBarInteractor.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation

final class FirstTabBarInteractor {
    private let presenter: FirstTabBarPresenterProtocol
    var coordinatorDelegate: FirstTabBarCoordinatorDelegate?

    init(presenter: FirstTabBarPresenterProtocol) {
        self.presenter = presenter
    }
}

extension FirstTabBarInteractor: FirstTabBarInteractorProtocol  {
    func initial() {
        presenter.initial()
    }

    func dayTapped(index: Int, type: Models.FirstTabBarModel.WeekCalendarType) {
        presenter.dayTapped(index: index, type: type)
    }

    func addButtonTapped() {
        coordinatorDelegate?.addButtonTapped()
    }
}
