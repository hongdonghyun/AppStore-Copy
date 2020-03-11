//
//  DetailTitleCell.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/07.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DetailTitleCell: UITableViewCell {
    static let identifier = "DetailTitleCell"
    
    private let topView = UIView()
    private let thumbnailImageView = CachedImageView()
    private let titleLabel = BlackLabel()
    
    private let subTitleLabel = GrayLabel()
    
    private let downloadBtn: DownloadButton = {
        let button = DownloadButton()
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)

        return button
    }()
    
    private let shareBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        return button
    }()
    
    private let bottomView = UIView()
    
    private let ratingContentView = UIView()
    private let ratingLabel = BlackLabel()
    private let ratingDescriptionLabel = BlackLabel()
    
    private let rankContentView = UIView()
    private let rankLabel = BlackLabel(text: "#1")
    private let rankDescriptionLabel = BlackLabel()
    
    private let ageContentView = UIView()
    private let ageLabel = BlackLabel()
    private let ageDescriptionLabel = BlackLabel(text: "연령")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - ACTIONS
extension DetailTitleCell {
    func configure(image: String, title: String, subTitle: String, average: Double, reviewCnt: Int, genre: String, age: String, appStoreURL: String?) {
        thumbnailImageView.URLString = image
        titleLabel.text = title
        subTitleLabel.text = subTitle
        ratingLabel.text = "\(average)"
        ratingDescriptionLabel.text = "\(reviewCnt)"
        rankDescriptionLabel.text = genre
        ageLabel.text = age
        if let url = appStoreURL { downloadBtn.url = URL(string: url) }
        
    }
}

//MARK: - UI
extension DetailTitleCell {
    private func setupAttr() {
        [ratingLabel, ratingDescriptionLabel, rankLabel, rankDescriptionLabel, ageLabel, ageDescriptionLabel].forEach {
            $0.getTextSize(type: .medium16)
        }
        titleLabel.getTextSize(type: .bold26)
        subTitleLabel.getTextSize(type: .light20)
    
    }
    private func setupUI() {
        setupAttr()
        let safeArea = self.contentView
        [thumbnailImageView, topView, bottomView].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 120),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 120),
            
            topView.topAnchor.constraint(equalTo: thumbnailImageView.topAnchor),
            topView.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor),
            topView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            topView.bottomAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor),
            
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            bottomView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            bottomView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)
        ])
        
        [titleLabel, subTitleLabel, downloadBtn, shareBtn].forEach {
            topView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.5),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            subTitleLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.2),
            
            downloadBtn.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor),
            downloadBtn.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            downloadBtn.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            downloadBtn.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.3),
            
            shareBtn.centerYAnchor.constraint(equalTo: downloadBtn.centerYAnchor),
            shareBtn.trailingAnchor.constraint(equalTo: topView.trailingAnchor)
        ])
        
        [ratingContentView, rankContentView, ageContentView].forEach {
            bottomView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            ratingContentView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            ratingContentView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            ratingContentView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            
            rankContentView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            rankContentView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            rankContentView.leadingAnchor.constraint(equalTo:ratingContentView.trailingAnchor),
            rankContentView.widthAnchor.constraint(equalTo: ratingContentView.widthAnchor, multiplier: 0.5),
            
            ageContentView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            ageContentView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            ageContentView.leadingAnchor.constraint(equalTo:rankContentView.trailingAnchor),
            ageContentView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            ageContentView.widthAnchor.constraint(equalTo: ratingContentView.widthAnchor, multiplier: 0.5),

        ])
        
        [ratingLabel, ratingDescriptionLabel].forEach {
            ratingContentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: ratingContentView.topAnchor),
            ratingLabel.bottomAnchor.constraint(equalTo: ratingContentView.bottomAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: ratingContentView.leadingAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: ratingContentView.trailingAnchor),
            
            ratingDescriptionLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor),
            ratingDescriptionLabel.leadingAnchor.constraint(equalTo: ratingLabel.leadingAnchor),
            
        ])

        [rankLabel, rankDescriptionLabel].forEach {
            rankContentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            rankLabel.topAnchor.constraint(equalTo: rankContentView.topAnchor),
            rankLabel.bottomAnchor.constraint(equalTo: rankContentView.bottomAnchor),
            rankLabel.centerXAnchor.constraint(equalTo: rankContentView.centerXAnchor),
            
            rankDescriptionLabel.topAnchor.constraint(equalTo: rankLabel.bottomAnchor),
            rankDescriptionLabel.centerXAnchor.constraint(equalTo: rankLabel.centerXAnchor),

        ])

        [ageLabel, ageDescriptionLabel].forEach {
            ageContentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: ageContentView.topAnchor),
            ageLabel.bottomAnchor.constraint(equalTo: ageContentView.bottomAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: ageContentView.trailingAnchor),
            
            ageDescriptionLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor),
            ageDescriptionLabel.trailingAnchor.constraint(equalTo: ageLabel.trailingAnchor),
        ])
    }
}
