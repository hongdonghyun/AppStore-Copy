//
//  DetailNewFunctionCell.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/09.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

protocol DetailTableCellMoreBtnSelected: class {
    func cellTapped()
}

class DetailNewFunctionCell: UITableViewCell {
    static let identifier = "DetailNewFunctionCell"
    weak var delegate: DetailTableCellMoreBtnSelected?
    private let titleView = UIView()
    private let titleLabel = BlackLabel(text: "새로운 기능")
    private let versionLabel = GrayLabel()
    private let releaseDateLabel = GrayLabel()
    
    private let descriptionView = UIView()
    private let descriptionLabel = BlackLabel()
    private lazy var moreBtn = LinkLabel(text: "   더 보기 ")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradation(moreBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - ACTIONS
extension DetailNewFunctionCell {
    func configure(version: String, releaseDate: Date, releaseNote: String) {
        versionLabel.text = "버전 \(version)"
        releaseDateLabel.text = "\(daysBetween(start: releaseDate, end: Date()))일 전"
        descriptionLabel.text = releaseNote
        
    }
    
    @objc private func moreBtnAction(_ sender: UITapGestureRecognizer) {
        guard let delegate = delegate else { return }
        descriptionLabel.numberOfLines = 0
        moreBtn.isHidden = true
        delegate.cellTapped()
        
    }
}

//MARK: - UI
extension DetailNewFunctionCell {
    private func setupAttr() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(moreBtnAction(_:)))
        moreBtn.isUserInteractionEnabled = true
        moreBtn.addGestureRecognizer(tap)
        
        descriptionLabel.numberOfLines = 3
        descriptionLabel.lineBreakMode = .byClipping
        
        titleLabel.getTextSize(type: .bold26)
        [versionLabel, releaseDateLabel, moreBtn].forEach {
            $0.getTextSize(type: .light16)
        }
    }
    
    private func setupUI() {
        setupAttr()
        [titleView, descriptionView].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            titleView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            descriptionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 5),
            descriptionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
        ])
        
        [titleLabel, versionLabel, releaseDateLabel].forEach {
            titleView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
            
            versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            versionLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
            versionLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            
            releaseDateLabel.centerYAnchor.constraint(equalTo: versionLabel.centerYAnchor),
            releaseDateLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
        ])
        
        [descriptionLabel, moreBtn].forEach {
            descriptionView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
            
            moreBtn.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            moreBtn.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor)
            
        ])
    }
}
