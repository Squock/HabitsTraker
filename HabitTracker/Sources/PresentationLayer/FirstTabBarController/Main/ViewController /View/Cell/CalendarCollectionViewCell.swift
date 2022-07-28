//
//  CalendarCollectionViewCell.swift
//  HabitTracker
//
//  Created by Rodion on 26.07.2022.
//

import UIKit
import SnapKit

class CalendarCollectionViewCell: UICollectionViewCell {
    private lazy var view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        return view
    }()
    private lazy var dayNumber: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: Constants.dayNumberFontSize)
        return label
    }()

    private lazy var dayName: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(Constants.dayNameFontSize)
        label.textAlignment = .center
        return label
    }()

    private lazy var gripperView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = Constants.gripperViewRadius
        return view
    }()

    private enum Constants {
        static let defaultTop: CGFloat = 8
        static let gripperHeight: CGFloat = 4
        static let gripperWidth: CGFloat = 25
        static let dayNumberLeadingTrailing: CGFloat = 8
        static let dayNameFontSize: CGFloat = 8
        static let gripperViewRadius: CGFloat = 2
        static let dayNumberFontSize: CGFloat = 20
        static let rootViewWidth: CGFloat = 45
        static let containerViewEdges: CGFloat = 2
    }

    static let identifier = String(describing: CalendarCollectionViewCell.self)

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
        contentView.addSubview(view)
        view.addSubview(dayName)
        view.addSubview(dayNumber)
        view.addSubview(gripperView)
    }

    private func makeConstraints() {
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(Constants.rootViewWidth)
        }
        dayName.snp.makeConstraints {
            $0.top.equalTo(Constants.defaultTop)
            $0.leading.trailing.equalToSuperview()
            $0.centerX.equalTo(dayNumber)
        }
        dayNumber.snp.makeConstraints {
            $0.top.equalTo(dayName.snp.bottom).offset(Constants.defaultTop)
            $0.leading.trailing.equalToSuperview().inset(Constants.dayNumberLeadingTrailing)
        }
        gripperView.snp.makeConstraints {
            $0.top.equalTo(dayNumber.snp.bottom).offset(Constants.defaultTop)
            $0.bottom.equalToSuperview().inset(Constants.defaultTop)
            $0.height.equalTo(Constants.gripperHeight)
            $0.centerX.equalTo(dayNumber)
            $0.width.equalTo(Constants.gripperWidth)
        }
    }

    func setup(model: Models.FirstTabBarModel.CalendarCellViewModel.Model) {
        dayName.text = model.dayName
        dayNumber.text = model.dayNumber
        dayNumber.textColor = model.color
        dayName.textColor = model.color
        if model.isSelect {
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.systemBlue.cgColor
        } else {
            view.layer.borderWidth = 0
        }
        /*if model.isToday {
            dayNumber.textColor = .systemBlue
            dayName.textColor = .systemBlue
            gripperView.backgroundColor = .systemBlue
        }
        
        switch model.type {
        case .next:
            dayNumber.textColor = .systemGray5
            dayName.textColor = .systemGray5
            gripperView.backgroundColor = .systemGray5
        default:
            debugPrint("Other types")
        }*/
    }
}
