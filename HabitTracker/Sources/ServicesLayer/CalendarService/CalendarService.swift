//
//  CalendarService.swift
//  HabitTracker
//
//  Created by Rodion on 26.07.2022.
//

import Foundation

final class CalendarService {
    private func calculateDays(days: [Date]) -> Models.CalendarServiceModel.CommonGetWeekModel {
        var calendarModel: Models.CalendarServiceModel.CommonGetWeekModel = .init()
        let daysNameFormatter = DateFormatter()
        daysNameFormatter.dateFormat = "EE"
        let calendar = Calendar.current
        for day in days {
            calendarModel.daysName.append(daysNameFormatter.string(from: day))
            calendarModel.daysNumber.append(calendar.component(.day, from: day))
        }
        calendarModel.date = days
        return calendarModel
    }
}

extension CalendarService: CalendarServiceProtocol {
    func getDays() -> Models.CalendarServiceModel.Model {
        let lastWeekDate = Calendar(identifier: .iso8601).date(byAdding: .weekOfYear, value: -1, to: Date())
        let nextWeekDate = Calendar(identifier: .iso8601).date(byAdding: .weekOfYear, value: 1, to: Date())
        var lastWeekDays: [Date] = []
        var currentWeekDays: [Date] = []
        var nextWeekDays: [Date] = []
        if let lastWeekDate = lastWeekDate {
            lastWeekDays = Calendar.current.daysWithSameWeekOfYear(as: lastWeekDate)
        }
        if let nextWeekDate = nextWeekDate {
            nextWeekDays = Calendar.current.daysWithSameWeekOfYear(as: nextWeekDate)
        }
        currentWeekDays = Calendar.current.daysWithSameWeekOfYear(as: Date())

        let previousWeek = calculateDays(days: lastWeekDays)
        let currentWeek = calculateDays(days: currentWeekDays)
        let nextWeek = calculateDays(days: nextWeekDays)
        
        let model: Models.CalendarServiceModel.Model = .init(lastWeekModel: previousWeek,
                                                             currentWeekModel: currentWeek,
                                                             nextWeekModel: nextWeek)
        return model
    }
}
