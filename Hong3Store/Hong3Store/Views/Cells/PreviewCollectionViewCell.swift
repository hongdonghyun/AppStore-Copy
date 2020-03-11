//
//  PreviewCollectionCell.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/05.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class PreviewCollectionCell: UICollectionViewCell {
    
    static let identifier = "PreviewCollectionCell"
    
    private let topLine = Seperator()
    private let titleLabel = BlackLabel()
    private let subTitleLabel = GrayLabel()
    private let imageView = CachedImageView()
    
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
extension PreviewCollectionCell {
    func configure(title: String?, subTitle: String?, imageURL: String) {
        guard let title = title, let subTitle = subTitle else { return }
        titleLabel.text = title
        subTitleLabel.text = subTitle
        imageView.URLString = imageURL
    }
}

//MARK: - UI
extension PreviewCollectionCell {
    private func setupAttr() {
        titleLabel.getTextSize(type: .bold30)
        subTitleLabel.getTextSize(type: .light20)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    private func setupUI() {
        setupAttr()
        let safeArea = self.contentView
        
        [topLine, titleLabel, subTitleLabel, imageView].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            
            topLine.topAnchor.constraint(equalTo: safeArea.topAnchor),
            topLine.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            topLine.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            topLine.heightAnchor.constraint(equalToConstant: 1),
            
            titleLabel.topAnchor.constraint(equalTo: topLine.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
//            titleLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.15),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
//            subTitleLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.1),
            
            imageView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            imageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.7),
            
        ])
    }
}
