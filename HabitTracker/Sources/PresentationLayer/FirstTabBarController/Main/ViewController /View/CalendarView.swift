//
//  CalendarView.swift
//  HabitTracker
//
//  Created by Rodion on 25.07.2022.
//

import UIKit
import SnapKit

final class CalendarView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.estimatedItemSize = CGSize(width: 1, height: 1)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        return collectionView
    }()
    private var viewModel: [Models.FirstTabBarModel.CalendarCellViewModel.Model] = []
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
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(collectionView)
    }

    private func makeConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func setup(viewModel: [Models.FirstTabBarModel.CalendarCellViewModel.Model]) {
        self.viewModel = viewModel
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
}

extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CalendarCollectionViewCell.identifier,
            for: indexPath
        ) as? CalendarCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        cell.setup(model: viewModel[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        actionDelegate?.dayDidTap(index: indexPath.row, type: viewModel[indexPath.row].type)
    }
}
