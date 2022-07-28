//
//  FirstTabBarPresenterProtocol.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation

protocol FirstTabBarPresenterProtocol: AnyObject {
    func initial()
    func dayTapped(index: Int, type: Models.FirstTabBarModel.WeekCalendarType)
}
