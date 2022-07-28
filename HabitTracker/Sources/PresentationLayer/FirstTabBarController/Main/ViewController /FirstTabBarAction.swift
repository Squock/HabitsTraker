//
//  FirstTabBarAction.swift
//  HabitTracker
//
//  Created by Rodion on 27.07.2022.
//

import Foundation

protocol FirstTabBarActionProtocol: AnyObject {
    func dayDidTap(index: Int, type: Models.FirstTabBarModel.WeekCalendarType)
}
