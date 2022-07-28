//
//  FirstTabBarPresenter.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import Foundation

final class FirstTabBarPresenter {
    private let viewController: FIrstTabBarViewControllerProtocol
    private let calendarSerice: CalendarServiceProtocol
    private let dateService: DateServiceProtocol
    private var viewModel: Models.FirstTabBarModel.ViewModel = .init()

    init(viewController: FIrstTabBarViewControllerProtocol,
         calendarService: CalendarServiceProtocol,
         dateService: DateServiceProtocol) {
        self.viewController = viewController
        self.calendarSerice = calendarService
        self.dateService = dateService
    }

    private func calculateModel(model: Models.CalendarServiceModel.CommonGetWeekModel, type: Models.FirstTabBarModel.WeekCalendarType) -> [Models.FirstTabBarModel.CalendarCellViewModel.Model] {
        var calendarModel: [Models.FirstTabBarModel.CalendarCellViewModel.Model] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "DD"
        for i in 0 ... model.daysName.count - 1 {
            let dayNumberString = String(model.daysNumber[i])
            let isToday = (Int(dateFormatter.string(from: Date())) ?? 0) - (Int(dateFormatter.string(from: model.date[i])) ?? 0) == 0 ? true : false
            calendarModel.append(.init(dayName: model.daysName[i], dayNumber: dayNumberString, isSelect: isToday, isToday: isToday, date: model.date[i], type: type))
        }
        return calendarModel
    }

    private func disableSelect() {
        for i in 0 ... viewModel.calendarModel.lastWeek.count - 1 {
            viewModel.calendarModel.lastWeek[i].isSelect = false
        }
        for i in 0 ... viewModel.calendarModel.currentWeek.count - 1 {
            viewModel.calendarModel.currentWeek[i].isSelect = false
        }
        for i in 0 ... viewModel.calendarModel.nextWeek.count - 1 {
            viewModel.calendarModel.nextWeek[i].isSelect = false
        }
    }

    private func setColor(model: Models.FirstTabBarModel.ViewModel) {
        var todayIndex = 1000
        for i in 0 ... viewModel.calendarModel.nextWeek.count - 1 {
            viewModel.calendarModel.nextWeek[i].color = .systemGray5
        }
        for i in 0 ... viewModel.calendarModel.currentWeek.count - 1 {
            if viewModel.calendarModel.currentWeek[i].isToday {
                todayIndex = i
                viewModel.calendarModel.currentWeek[i].color = .systemBlue
            }
            if i > todayIndex {
                viewModel.calendarModel.currentWeek[i].color = .systemGray5
            }
        }
    }
}

extension FirstTabBarPresenter: FirstTabBarPresenterProtocol {
    func initial() {
        let daysModel = calendarSerice.getDays()
        let lastWeek = calculateModel(model: daysModel.lastWeekModel, type: .previous)
        let currentWeek = calculateModel(model: daysModel.currentWeekModel, type: .current)
        let nextWeek = calculateModel(model: daysModel.nextWeekModel, type: .next)
        let calendarModel = Models.FirstTabBarModel.CalendarViewModel.init(lastWeek: lastWeek,
                                                                   currentWeek: currentWeek,
                                                                   nextWeek: nextWeek)
        let title = dateService.getDateTitle(date: Date(), isToday: true)
        let viewModel: Models.FirstTabBarModel.ViewModel = .init(calendarModel: calendarModel, title: title)
        self.viewModel = viewModel
        setColor(model: viewModel)
        viewController.initial(self.viewModel)
    }

    func dayTapped(index: Int, type: Models.FirstTabBarModel.WeekCalendarType) {
        disableSelect()
        switch type {
        case .previous:
            viewModel.calendarModel.lastWeek[index].isSelect = true
            let date = viewModel.calendarModel.lastWeek[index].date
            viewModel.title = dateService.getDateTitle(date: date, isToday: false)
        case .current:
            viewModel.calendarModel.currentWeek[index].isSelect = true
            let date = viewModel.calendarModel.currentWeek[index].date
            viewModel.title = dateService.getDateTitle(date: date, isToday: viewModel.calendarModel.currentWeek[index].isToday)
        case .next:
            viewModel.calendarModel.nextWeek[index].isSelect = true
            let date = viewModel.calendarModel.nextWeek[index].date
            viewModel.title = dateService.getDateTitle(date: date, isToday: false)
        }
        viewController.initial(viewModel)
    }
}
