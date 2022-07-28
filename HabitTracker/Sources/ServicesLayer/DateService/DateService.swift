//
//  DateService.swift
//  HabitTracker
//
//  Created by Rodion on 28.07.2022.
//

import Foundation

final class DateService {}

extension DateService: DateServiceProtocol {
    func getDateTitle(date: Date, isToday: Bool) -> String {
        let dateFormatter = DateFormatter()
        var dateString = ""
        if isToday {
            dateString = "Сегодня"
        } else {
            dateFormatter.dateFormat = "E, d MMMM"
            dateString = dateFormatter.string(from: date)
        }
        return dateString
    }
}
