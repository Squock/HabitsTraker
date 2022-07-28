//
//  HasContentView.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import UIKit

protocol HasContentView {
    associatedtype ContentView: UIView

    var contentView: ContentView! { get }
    func loadContentView()
}

extension HasContentView where Self: UIViewController {
    var contentView: ContentView! {
        view as? ContentView
    }

    func loadContentView() {
        view = ContentView()
    }
}
