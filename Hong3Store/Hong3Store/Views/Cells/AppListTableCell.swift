//
//  AppListTableCell.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/10.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class AppListTableCell: UITableViewCell {
    static let identifier = "AppListTableCell"
    
    private let imgView = CachedImageView()
    private let containerView = UIView()
    private let titleLabel = BlackLabel()
    private let subTitleLabel = GrayLabel()
    private let seperator = Seperator()
    private let downloadBtn = DownloadButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

// MARK: - ACTIONS
extension AppListTableCell {
    func configure(title: String, subTitle: String, imageUrl: String, id: String, appStoreURL: String?) {
        imgView.URLString = imageUrl
        titleLabel.text = title
        subTitleLabel.text = subTitle
        if let url = appStoreURL {
            downloadBtn.url = URL(string: url)
        }
    }
}

// MARK: - UI
extension AppListTableCell {
    private func setupUI() {
        [imgView, containerView, seperator].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            imgView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            imgView.widthAnchor.constraint(equalToConstant: 80),
            imgView.heightAnchor.constraint(equalToConstant: 80),
            
            containerView.topAnchor.constraint(equalTo: imgView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 90),
            
            seperator.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10),
            seperator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            seperator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 5),
            seperator.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            seperator.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        [titleLabel, subTitleLabel, downloadBtn].forEach {
            containerView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            downloadBtn.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 10),
            downloadBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            downloadBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
        ])

        
    }
}
