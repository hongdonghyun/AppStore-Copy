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
    
    private let imageView: CachedImageView = {
        let imageView = CachedImageView(image: nil)
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .title2)
        
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()
    
    private let underLine = Seperator()
    
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

extension TopgrossCollectionCell {
    func configure(title: String?, subTitle: String?, imageURL: String) {
        guard let title = title, let subTitle = subTitle else { return }
        titleLabel.text = title
        subTitleLabel.text = subTitle
        imageView.URLString = imageURL
    }
}

extension TopgrossCollectionCell {
    private func setupUI() {
        let safeArea = self.contentView
        // , subTitleLabel, titleLabel
        [imageView, titleLabel, subTitleLabel, underLine].forEach {
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
            titleLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
            titleLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
            subTitleLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
            subTitleLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
            
            underLine.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor),
            underLine.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
            underLine.heightAnchor.constraint(equalToConstant: 1),
            underLine.widthAnchor.constraint(equalToConstant: self.frame.width - self.frame.height),
            
            
        ])
    }
}
