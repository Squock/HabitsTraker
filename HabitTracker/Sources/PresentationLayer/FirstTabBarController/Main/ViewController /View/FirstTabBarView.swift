//
//  FirstTabBarView.swift
//  HabitTracker
//
//  Created by Rodion on 24.07.2022.
//

import UIKit
import SnapKit

final class FirstTabBarView: UIView {
    private lazy var calendarView = WeekCollectionView()
    private lazy var tableView = ExerciseTableView()
    weak var actionDelegate: FirstTabBarActionProtocol?

    private enum Constants {
        static let calendarViewHeight: CGFloat = 180
    }

    override init(
        frame: CGRect = .zero
    ) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        setupViews()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(calendarView)
        addSubview(tableView)
    }

    private func makeConstraints() {
        calendarView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constants.calendarViewHeight)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(calendarView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    func setup(viewModel: Models.FirstTabBarModel.ViewModel) {
        calendarView.setup(viewModel: viewModel)
        calendarView.actionDelegate = actionDelegate
    }

    func viewDidAppear() {
        calendarView.viewDidAppear()
    }
}
