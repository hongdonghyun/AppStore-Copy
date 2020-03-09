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
    private let thumbnailImageView = CachedImageView(image: UIImage(named: "xxx"))
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "당근마켓 - 중고거래 필수앱"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.text = "우리 동네 중고 직거래 벼룩장터"
        return label
    }()
    
    private let downloadBtn: UIButton = {
        let button = UIButton()
        button.setTitle("     받기     ", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let shareBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        return button
    }()
    
    private let bottomView = UIView()
    private let ratingContentView = UIView()
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.4 별별별별별"
        return label
    }()
    
    private let ratingDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "8천개의 평가"
        return label
    }()
    
    private let rankContentView = UIView()
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.text = "#1"
        return label
    }()
    private let rankDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "쇼핑"
        return label
    }()
    
    private let ageContentView = UIView()
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "4+"
        return label
    }()
    private let ageDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "연령"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailTitleCell {
    func configure(image: String, title: String, subTitle: String, average: Double, reviewCnt: Int, genre: String, age: String) {
        thumbnailImageView.URLString = image
        titleLabel.text = title
        descriptionLabel.text = subTitle
        ratingLabel.text = "\(average)"
        ratingDescriptionLabel.text = "\(reviewCnt)"
        rankDescriptionLabel.text = genre
        ageLabel.text = age
    }
}

extension DetailTitleCell {
    private func setupUI() {
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
        
        [titleLabel, descriptionLabel, downloadBtn, shareBtn].forEach {
            topView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.5),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            descriptionLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.2),
            
            downloadBtn.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
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
//            rankLabel.leadingAnchor.constraint(equalTo: rankContentView.leadingAnchor),
//            rankLabel.trailingAnchor.constraint(equalTo: rankContentView.trailingAnchor),
            
            rankDescriptionLabel.topAnchor.constraint(equalTo: rankLabel.bottomAnchor),
            rankDescriptionLabel.centerXAnchor.constraint(equalTo: rankLabel.centerXAnchor),
//            rankDescriptionLabel.leadingAnchor.constraint(equalTo: rankLabel.leadingAnchor),
        ])

        [ageLabel, ageDescriptionLabel].forEach {
            ageContentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: ageContentView.topAnchor),
            ageLabel.bottomAnchor.constraint(equalTo: ageContentView.bottomAnchor),
//            ageLabel.leadingAnchor.constraint(equalTo: ageContentView.leadingAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: ageContentView.trailingAnchor),
            
            ageDescriptionLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor),
            ageDescriptionLabel.trailingAnchor.constraint(equalTo: ageLabel.trailingAnchor),
        ])
    }
}
