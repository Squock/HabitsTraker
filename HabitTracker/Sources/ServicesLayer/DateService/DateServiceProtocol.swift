//
//  DateServiceProtocol.swift
//  HabitTracker
//
//  Created by Rodion on 28.07.2022.
//

import Foundation

protocol DateServiceProtocol: AnyObject {
    func getDateTitle(date: Date, isToday: Bool) -> String
}
