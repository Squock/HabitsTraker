//
//  FirstTabBarModel.swift
//  HabitTracker
//
//  Created by Rodion on 26.07.2022.
//

import Foundation
import UIKit

extension Models {
    enum FirstTabBarModel {}
}

extension Models.FirstTabBarModel {
    struct ViewModel {
        var calendarModel: CalendarViewModel
        var title: String

        init(calendarModel: CalendarViewModel = .init(),
             title: String = "") {
            self.calendarModel = calendarModel
            self.title = title
        }
    }
}

extension Models.FirstTabBarModel {
    struct CalendarViewModel {
        var lastWeek: [Models.FirstTabBarModel.CalendarCellViewModel.Model]
        var currentWeek: [Models.FirstTabBarModel.CalendarCellViewModel.Model]
        var nextWeek: [Models.FirstTabBarModel.CalendarCellViewModel.Model]

        init(lastWeek: [Models.FirstTabBarModel.CalendarCellViewModel.Model] = [],
             currentWeek: [Models.FirstTabBarModel.CalendarCellViewModel.Model] = [],
             nextWeek: [Models.FirstTabBarModel.CalendarCellViewModel.Model] = []) {
            self.lastWeek = lastWeek
            self.currentWeek = currentWeek
            self.nextWeek = nextWeek
        }
    }
}

extension Models.FirstTabBarModel {
    enum CalendarCellViewModel {
        struct Model {
            let dayName: String
            let dayNumber: String
            var isSelect: Bool
            let isToday: Bool
            let date: Date
            let type: WeekCalendarType
            var color: UIColor

            init(dayName: String = "",
                 dayNumber: String = "",
                 isSelect: Bool = false,
                 isToday: Bool = false,
                 date: Date = Date(),
                 type: WeekCalendarType = .current,
                 color: UIColor = .black) {
                self.dayName = dayName
                self.dayNumber = dayNumber
                self.isSelect = isSelect
                self.isToday = isToday
                self.date = date
                self.type = type
                self.color = color
            }
        }
    }

    enum WeekCalendarType {
        case previous
        case current
        case next
    }
}
