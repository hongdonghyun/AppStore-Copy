//
//  DetailInfoCell.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/09.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DetailInfoCell: UITableViewCell {
    static let identifier = "DetailInfoCell"
    let titleLabel = BlackLabel(text: "정보")
    let stackView = InfoStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}

extension DetailInfoCell {
    func configure(seller: String, appSize: String, category: [String],
                   OSVersion: String, language: [String], Advisory: String,
                   sellerUrl: String) {
        
        for (index, text) in [seller, byteToMB(appSize), strArrToStr(category), OSVersion, strArrToStr(language), Advisory].enumerated() {
            if let _label = stackView.viewWithTag(9999 - index), let label = _label as? UILabel {
                switch index {
                case 3:
                    label.text = "iOS \(text) 버전 이상"
                default:
                    label.text = text
                }
                
            }
        }
    }
}

extension DetailInfoCell {
    private func setupAttr() {
        titleLabel.getTextSize(type: .bold26)
    }
    private func setupUI() {
        setupAttr()
        [titleLabel, stackView].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
        ])
    }
}
