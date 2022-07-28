//
//  ExerciseTableView.swift
//  HabitTracker
//
//  Created by Rodion on 28.07.2022.
//

import UIKit

class ExerciseTableView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()

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
        addSubview(tableView)
        tableView.backgroundColor = .systemGray5
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: ExerciseTableViewCell.identifier)
    }

    private func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ExerciseTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ExerciseTableViewCell.identifier,
            for: indexPath
        ) as? ExerciseTableViewCell
        else {
            return UITableViewCell()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
