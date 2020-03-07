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
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "당근마켓 - 중고거래 필수앱"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "우리 동네 중고 직거래 벼룩장터"
        return label
    }()
    
    private let downloadBtn: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.black, for: .normal)
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
    private func setupUI() {
        let safeArea = self.contentView
        [topView, bottomView].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            topView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            topView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            bottomView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            bottomView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
        [thumbnailImageView, titleLabel, descriptionLabel, downloadBtn, shareBtn].forEach {
            topView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: topView.topAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 100),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 5),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 5),
            
            downloadBtn.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            downloadBtn.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 5),
            
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
            rankContentView.widthAnchor.constraint(equalTo: ratingContentView.widthAnchor),
            
            ageContentView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            ageContentView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            ageContentView.leadingAnchor.constraint(equalTo:rankContentView.trailingAnchor),
            ageContentView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            ageContentView.widthAnchor.constraint(equalTo: ratingContentView.widthAnchor),

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
            rankLabel.leadingAnchor.constraint(equalTo: rankContentView.leadingAnchor),
            rankLabel.trailingAnchor.constraint(equalTo: rankContentView.trailingAnchor),
            
            rankDescriptionLabel.topAnchor.constraint(equalTo: rankLabel.bottomAnchor),
            rankDescriptionLabel.leadingAnchor.constraint(equalTo: rankLabel.leadingAnchor),
        ])

        [ageLabel, ageDescriptionLabel].forEach {
            ageContentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: ageContentView.topAnchor),
            ageLabel.bottomAnchor.constraint(equalTo: ageContentView.bottomAnchor),
            ageLabel.leadingAnchor.constraint(equalTo: ageContentView.leadingAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: ageContentView.trailingAnchor),
            
            ageDescriptionLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor),
            ageDescriptionLabel.leadingAnchor.constraint(equalTo: ageLabel.leadingAnchor),
        ])
    }
}
