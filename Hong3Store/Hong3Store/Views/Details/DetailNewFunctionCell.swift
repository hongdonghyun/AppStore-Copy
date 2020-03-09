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
    private let descriptionView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 기능"
        label.font = .systemFont(ofSize: 23)
        return label
    }()
    
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private let descrptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.lineBreakMode = .byClipping
        return label
    }()
    
    private lazy var moreBtn: UILabel = {
        let label = UILabel()
        let tap = UITapGestureRecognizer(target: self, action: #selector(moreBtnAction(_:)))
        label.text = "   더 보기 "
        label.textColor = .link
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        return label
    }()
    
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

extension DetailNewFunctionCell {
    func configure(version: String, releaseDate: Date, releaseNote: String) {
        versionLabel.text = "버전 \(version)"
        releaseDateLabel.text = "\(daysBetween(start: releaseDate, end: Date()))일 전"
        descrptionLabel.text = releaseNote
        
    }
}

extension DetailNewFunctionCell {
    @objc private func moreBtnAction(_ sender: UITapGestureRecognizer) {
        guard let delegate = delegate else { return }
        descrptionLabel.numberOfLines = 0
        moreBtn.isHidden = true
        delegate.cellTapped()
        
    }
}

extension DetailNewFunctionCell {
    private func setupUI() {
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
        
        [descrptionLabel, moreBtn].forEach {
            descriptionView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            descrptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor),
            descrptionLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor),
            descrptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            descrptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
            
            moreBtn.bottomAnchor.constraint(equalTo: descrptionLabel.bottomAnchor),
            moreBtn.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor)
            
        ])
    }
}
