//
//  WeekCollectionViewCell.swift
//  HabitTracker
//
//  Created by Rodion on 26.07.2022.
//

import UIKit
import SnapKit

class WeekCollectionViewCell: UICollectionViewCell {
    private lazy var calendarView = CalendarView()
    static let identifier = String(describing: WeekCollectionViewCell.self)
    weak var actionDelegate: FirstTabBarActionProtocol?

    override init(
        frame: CGRect = .zero
    ) {
        super.init(frame: frame)
        setupViews()
        makeConstraints()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(calendarView)
    }

    private func makeConstraints() {
        calendarView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func setup(model: [Models.FirstTabBarModel.CalendarCellViewModel.Model]) {
        calendarView.setup(viewModel: model)
        calendarView.actionDelegate = actionDelegate
    }
}
