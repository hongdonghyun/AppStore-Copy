//
//  TopgrossCollectionCell.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/05.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class TopgrossCollectionCell: UICollectionViewCell {
    static let identifier = "TopgrossCollectionCell"
    
    private let imageView = CachedImageView()
    private let titleLabel = BlackLabel()
    private let subTitleLabel = GrayLabel()
    private let underLine = Seperator()
    private let downloadBtn: DownloadButton = {
        let button = DownloadButton()
        button.backgroundColor = .quaternaryLabel
        button.setTitleColor(.link, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ACTIONS
extension TopgrossCollectionCell {
    func configure(title: String?, subTitle: String?, imageURL: String, appStoreURL: String?) {
        guard let title = title, let subTitle = subTitle else { return }
        titleLabel.text = title
        subTitleLabel.text = subTitle
        imageView.URLString = imageURL
        if let url = appStoreURL { downloadBtn.url = URL(string: url) }
    }
    
}

// MARK: - UI
extension TopgrossCollectionCell {
    private func setupAttr() {
        titleLabel.getTextSize(type: .medium20)
        subTitleLabel.getTextSize(type: .light20)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        subTitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
    }
    private func setupUI() {
        setupAttr()
        let safeArea = self.contentView
        [imageView, titleLabel, subTitleLabel, downloadBtn, underLine].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            imageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 1),
            imageView.widthAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 1),
            
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
//            subTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            downloadBtn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            downloadBtn.centerYAnchor.constraint(equalTo: subTitleLabel.centerYAnchor),
            
            underLine.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 10),
            underLine.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
            underLine.heightAnchor.constraint(equalToConstant: 1),
            underLine.widthAnchor.constraint(equalToConstant: self.frame.width - self.frame.height),
        ])
        
    }
}
