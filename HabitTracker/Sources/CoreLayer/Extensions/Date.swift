//
//  Date.swift
//  HabitTracker
//
//  Created by Rodion on 27.07.2022.
//

import Foundation

extension Date {
    func days(to secondDate: Date, calendar: Calendar = Calendar.current) -> Int {
        guard let diff = calendar.dateComponents([.day], from: self, to: secondDate).day else { return 0 }
        return diff
    }
}
