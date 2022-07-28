//
//  ExerciseTableViewCell.swift
//  HabitTracker
//
//  Created by Rodion on 28.07.2022.
//

import UIKit
import SnapKit

class ExerciseTableViewCell: UITableViewCell {
    private lazy var view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 1
        return view
    }()
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Пить воду"
        label.font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)
        return label
    }()

    private lazy var text: UILabel = {
        let label = UILabel()
        label.text = "несколько дней подряд"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: Constants.textFontSize)
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "iconCircle"), for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        return button
    }()
    private var isCheck: Bool = false

    static let identifier = String(describing: ExerciseTableViewCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum Constants {
        static let titleFontSize: CGFloat = 20
        static let textFontSize: CGFloat = 12
        static let defaultInset: CGFloat = 8
        static let textTop: CGFloat = 6
        static let buttonSize: CGFloat = 24
        static let buttonInset: CGFloat = 16
        static let titleTop: CGFloat = 12
        static let textBottom: CGFloat = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setupViews() {
        backgroundColor = .systemGray5
        contentView.addSubview(view)
        view.backgroundColor = .white
        view.addSubview(title)
        view.addSubview(text)
        view.addSubview(button)
    }

    private func makeConstraints() {
        view.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Constants.defaultInset)
        }
        button.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: Constants.buttonSize, height: Constants.buttonSize))
            $0.leading.equalToSuperview().offset(Constants.buttonInset)
            $0.centerY.equalTo(view)
        }
        title.snp.makeConstraints {
            $0.leading.equalTo(button.snp.trailing).offset(Constants.defaultInset)
            $0.trailing.equalToSuperview().inset(Constants.defaultInset)
            $0.top.equalToSuperview().offset(Constants.titleTop)
        }
        text.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(Constants.textTop)
            $0.leading.trailing.equalTo(title)
            $0.bottom.equalToSuperview().inset(Constants.textBottom)
        }
    }

    @objc private func buttonDidTap() {
        if !isCheck {
            isCheck = true
            button.setImage(UIImage(named: "iconCheck"), for: .normal)
        } else {
            isCheck = false
            button.setImage(UIImage(named: "iconCircle"), for: .normal)
        }
        
    }
}
