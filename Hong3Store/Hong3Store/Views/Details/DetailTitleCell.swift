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
    private var starArray: [UIImage]?
    private let topView = UIView()
    private let thumbnailImageView = CachedImageView()
    
    private let titleLabel: UILabel = {
        let label = BlackLabel()
        label.accessibilityIdentifier = "detailTitleLabel"
        return label
    }()
    private let subTitleLabel = GrayLabel()
    private let downloadBtn = DownloadButton()
    
    private let shareBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        return button
    }()
    
    private let bottomView = UIView()
    
    private let ratingContentView = UIView()
    private let ratingLabel = GrayLabel()
    private let ratingStar = GrayLabel()
    private let ratingDescriptionLabel = GrayLabel()
    
    private let rankContentView = UIView()
    private let rankLabel = GrayLabel(text: "#1")
    private let rankDescriptionLabel = GrayLabel()
    
    private let ageContentView = UIView()
    private let ageLabel = GrayLabel()
    private let ageDescriptionLabel = GrayLabel(text: "연령")
    
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
    func configure(image: String, title: String, subTitle: String, average: Double, reviewCnt: Int, genre: String, age: String, appStoreURL: String?, rank: Int) {
        thumbnailImageView.URLString = image
        titleLabel.text = title
        subTitleLabel.text = subTitle
        ratingLabel.text = String(format: "%.1f", average)
        ratingStar.text = "\(starPrint(average))"
        ratingDescriptionLabel.text = digitDivider(reviewCnt)
        rankDescriptionLabel.text = genre
        ageLabel.text = age
        rankLabel.text = "#\(rank)"
        
        if let url = appStoreURL { downloadBtn.url = URL(string: url) }
        
    }
}

//MARK: - UI
extension DetailTitleCell {
    private func setupAttr() {
        [ratingLabel, rankLabel, ageLabel].forEach {
            $0.getTextSize(type: .medium16)
        }
        [ratingLabel, rankLabel, ageLabel].forEach {
            $0.getTextSize(type: .bold26)
        }
        [ratingDescriptionLabel, rankDescriptionLabel, ageDescriptionLabel].forEach {
            $0.getTextSize(type: .light12)
        }
        titleLabel.getTextSize(type: .bold20)
        subTitleLabel.getTextSize(type: .light16)
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        downloadBtn.backgroundColor = .link
        downloadBtn.setTitleColor(.white, for: .normal)
        downloadBtn.layer.cornerRadius = 15
        
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
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 100),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 100),
            
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
        
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            
            downloadBtn.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor),
            downloadBtn.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            downloadBtn.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            downloadBtn.heightAnchor.constraint(equalToConstant: 32),
            
            shareBtn.centerYAnchor.constraint(equalTo: downloadBtn.centerYAnchor),
            shareBtn.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            shareBtn.heightAnchor.constraint(equalToConstant: 32),
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
        
        [ratingLabel, ratingStar, ratingDescriptionLabel].forEach {
            ratingContentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: ratingContentView.topAnchor),
            ratingLabel.bottomAnchor.constraint(equalTo: ratingContentView.bottomAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: ratingContentView.leadingAnchor),
//            ratingLabel.trailingAnchor.constraint(equalTo: ratingContentView.trailingAnchor),
            
            ratingStar.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 5),
            ratingStar.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
            
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
            ageDescriptionLabel.centerXAnchor.constraint(equalTo: ageLabel.centerXAnchor)
        ])
    }
}
