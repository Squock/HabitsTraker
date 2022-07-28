//
//  FirstTabBarViewControllerTests.swift
//  HabitTrackerTests
//
//  Created by Rodion on 28.07.2022.
//

import XCTest
import SnapshotTesting
@testable import HabitTracker

class FirstTabBarViewControllerTests: XCTestCase {
    private var sut: FirstTabBarViewController!

    override func setUp() {
        super.setUp()
        sut = FirstTabBarViewController()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSnapshot() {
        let mockDay: Models.FirstTabBarModel.CalendarCellViewModel.Model = .init(dayName: "Чт", dayNumber: "12", isSelect: false, isToday: true, date: Date(), type: .current, color: .systemGray5)
        var mockWeek: [Models.FirstTabBarModel.CalendarCellViewModel.Model] = []
        for _ in 1 ... 7 {
            mockWeek.append(mockDay)
        }
        let calendarModel: App.Models.FirstTabBarModel.CalendarViewModel = .init(lastWeek: [],
                                                                                 currentWeek: mockWeek,
                                                                                 nextWeek: [])
        let model: Models.FirstTabBarModel.ViewModel = .init(calendarModel: calendarModel, title: "Сегодня")
        sut.initial(model)
        assertSnapshot(matching: sut, as: .image)
    }
}
