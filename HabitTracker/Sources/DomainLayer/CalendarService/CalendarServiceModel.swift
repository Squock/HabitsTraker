//
//  CalendarServiceModel.swift
//  HabitTracker
//
//  Created by Rodion on 26.07.2022.
//

import Foundation

extension Models {
    enum CalendarServiceModel {}
}

extension Models.CalendarServiceModel {

    struct CommonGetWeekModel {
        var daysNumber: [Int]
        var daysName: [String]
    }
}
