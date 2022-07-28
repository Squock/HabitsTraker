//
//  WeekCollectionView.swift
//  HabitTracker
//
//  Created by Rodion on 26.07.2022.
//

import UIKit
import SnapKit

final class WeekCollectionView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return collectionView
    }()
    private var viewModel: Models.FirstTabBarModel.ViewModel = .init()
    private var indexPath: IndexPath = .init()
    weak var actionDelegate: FirstTabBarActionProtocol?

    override init(
        frame: CGRect = .zero
    ) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        makeConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WeekCollectionViewCell.self, forCellWithReuseIdentifier: WeekCollectionViewCell.identifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(collectionView)
    }

    private func makeConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(8)
        }
    }

    func setup(viewModel: Models.FirstTabBarModel.ViewModel) {
        self.viewModel = viewModel
        collectionView.reloadData()
    }

    func viewDidAppear() {
        collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
    }
}

extension WeekCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WeekCollectionViewCell.identifier,
            for: indexPath
        ) as? WeekCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.actionDelegate = actionDelegate
        if indexPath.row == 0 {
            cell.setup(model: viewModel.calendarModel.lastWeek)
        }
        if indexPath.row == 1 {
            cell.setup(model: viewModel.calendarModel.currentWeek)
        }
        if indexPath.row == 2 {
            cell.setup(model: viewModel.calendarModel.nextWeek)
        }
        return cell
    }
}

extension WeekCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth, height: 80)
    }
}
