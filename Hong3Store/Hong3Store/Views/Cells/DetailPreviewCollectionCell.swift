//
//  DetailPreviewCollectionCell.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/09.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DetailPreviewCollectionCell: UICollectionViewCell {
    static let identifier = "DetailPreviewCollectionCell"
    
    private let imageView: CachedImageView = {
        let imageView = CachedImageView(image: UIImage(named: "xxx"))
        imageView.layer.cornerRadius = 20
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

extension DetailPreviewCollectionCell {
    private func setupUI() {
        [imageView].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

        ])
    }
}
