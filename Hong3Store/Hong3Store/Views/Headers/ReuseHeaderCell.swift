//
//  ReuseHeaderCell.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/06.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class ReuseHeaderCell: UITableViewHeaderFooterView {
    static let identifier = "ReuseHeaderCell"
    private let topLine = Seperator()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    private lazy var showMoreBtn: UIButton = {
        let button = UIButton()
        button.setTitle("모두 보기", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title2)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(showMoreBtnAction), for: .touchUpInside)
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


extension ReuseHeaderCell {
    
    @objc private func showMoreBtnAction(sender: UIButton) {
        print("click")
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
            
            showMoreBtn.topAnchor.constraint(equalTo: topLine.bottomAnchor, constant: 5),
            showMoreBtn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
        ])
    }
}

