//
//  CalendarServiceProtocol.swift
//  HabitTracker
//
//  Created by Rodion on 26.07.2022.
//

import Foundation

protocol CalendarServiceProtocol: AnyObject {
    func getDays() -> Models.CalendarServiceModel.Model
}
