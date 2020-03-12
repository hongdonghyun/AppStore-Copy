//
//  ReuseHeaderCell.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/06.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

protocol HeaderCellShowMoreBtnSelected: class {
    func showMoreBtnTapped(currentSection: Int)
}

class ReuseHeaderCell: UITableViewHeaderFooterView {
    static let identifier = "ReuseHeaderCell"
    private var currentSection = 0
    weak var delegate: HeaderCellShowMoreBtnSelected?
    private let topLine = Seperator()
    
    let titleLabel = BlackLabel()
    
    private lazy var showMoreBtn: UIButton = {
        let button = UIButton()
        button.setTitle("모두 보기", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title2)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(showMoreBtnAction), for: .touchUpInside)
        button.layoutSubviews()
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ACTIONS
extension ReuseHeaderCell {
    func configure(title: String, section: Int) {
        titleLabel.text = title
        currentSection = section
    }
    
    @objc private func showMoreBtnAction(sender: UIButton) {
        guard let delegate = delegate else { return }
        delegate.showMoreBtnTapped(currentSection: currentSection)
    }
}


// MARK: - UI
extension ReuseHeaderCell {
    private func setupAttr() {
        titleLabel.getTextSize(type: .bold20)
    }
    private func setupUI() {
        let safeArea = contentView.safeAreaLayoutGuide
        [topLine, titleLabel, showMoreBtn].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            topLine.topAnchor.constraint(equalTo: safeArea.topAnchor),
            topLine.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            topLine.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            topLine.heightAnchor.constraint(equalToConstant: 1),

            titleLabel.topAnchor.constraint(equalTo: topLine.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            
            showMoreBtn.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            showMoreBtn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            showMoreBtn.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        setupAttr()
    }
}

