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
    
    private let imgView = CachedImageView(image: nil)
    private let containerView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private let seperator = Seperator()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension AppListTableCell {
    func configure(title: String, subTitle: String, imageUrl: String, id: String) {
        imgView.URLString = imageUrl
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
}

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
            
            seperator.topAnchor.constraint(equalTo: containerView.bottomAnchor),
            seperator.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 5),
            seperator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 5),
            seperator.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            seperator.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        [titleLabel, subTitleLabel].forEach {
            containerView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//            titleLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//            subTitleLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5)
        ])

        
    }
}
