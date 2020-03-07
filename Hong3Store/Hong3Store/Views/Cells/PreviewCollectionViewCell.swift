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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .title1)
        
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()
    
    private let imageView: CachedImageView = {
        let imageView = CachedImageView(image: nil)
        return imageView
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

extension PreviewCollectionCell {
    func configure(title: String?, subTitle: String?, imageURL: String) {
        guard let title = title, let subTitle = subTitle else { return }
        titleLabel.text = title
        subTitleLabel.text = subTitle
        imageView.URLString = imageURL
    }
}

extension PreviewCollectionCell {
    private func setupUI() {
        let safeArea = self.contentView
        
        [topLine, titleLabel, subTitleLabel, imageView].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            
            topLine.topAnchor.constraint(equalTo: safeArea.topAnchor),
            topLine.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            topLine.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topLine.bottomAnchor, constant: 1),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.15),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            subTitleLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.1),
            
            imageView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            imageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.745),
            
        ])
    }
}
