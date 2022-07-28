//
//  FirstTabBarController.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import UIKit

class FirstTabBarViewController: UIViewController, HasContentView {
    typealias ContentView = FirstTabBarView
    var interactor: FirstTabBarInteractorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.actionDelegate = self
        interactor?.initial()
        navigationItem.rightBarButtonItem = .init(systemItem: .add)
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(addButtonDidTap))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contentView.viewDidAppear()
    }

    override func loadView() {
        loadContentView()
    }

    @objc private func addButtonDidTap() {
        interactor?.addButtonTapped()
    }
}

extension FirstTabBarViewController: FIrstTabBarViewControllerProtocol {
    func initial(_ model: Models.FirstTabBarModel.ViewModel) {
        contentView.setup(viewModel: model)
        navigationItem.title = model.title
    }
}

extension FirstTabBarViewController: FirstTabBarActionProtocol {
    func dayDidTap(index: Int, type: Models.FirstTabBarModel.WeekCalendarType) {
        interactor?.dayTapped(index: index, type: type)
    }
}
