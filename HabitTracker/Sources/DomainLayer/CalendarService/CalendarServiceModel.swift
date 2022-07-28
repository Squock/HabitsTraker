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
    struct Model {
        let lastWeekModel: CommonGetWeekModel
        let currentWeekModel: CommonGetWeekModel
        let nextWeekModel: CommonGetWeekModel

        init(lastWeekModel: CommonGetWeekModel = .init(),
             currentWeekModel: CommonGetWeekModel = .init(),
             nextWeekModel: CommonGetWeekModel = .init()) {
            self.lastWeekModel = lastWeekModel
            self.currentWeekModel = currentWeekModel
            self.nextWeekModel = nextWeekModel
        }
    }

    struct CommonGetWeekModel {
        var daysNumber: [Int]
        var daysName: [String]
        var date: [Date]

        init(daysNumber: [Int] = [],
             daysName: [String] = [],
             date: [Date] = []) {
            self.daysNumber = daysNumber
            self.daysName = daysName
            self.date = date
        }
    }
}
