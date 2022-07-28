//
//  HabitsInteractor.swift
//  HabitTracker
//
//  Created by Rodion on 28.07.2022.
//

import Foundation

final class HabitsInteractor {
    private let presenter: HabitsPresenterProtocol

    init(presenter: HabitsPresenterProtocol) {
        self.presenter = presenter
    }
}

extension HabitsInteractor: HabitsInteractorProtocol {}
