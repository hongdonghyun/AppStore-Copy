//
//  PreviewHeader.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/05.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class PreviewHeader: UITableViewHeaderFooterView {
    static let identifier = "PreviewHeader"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 50, weight: .bold)
        return label
    }()
    
    let profileImg: CachedImageView = {
        let imageView = CachedImageView(image: UIImage(named: "xxx"))
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PreviewHeader {
    private func setupUI() {
        [titleLabel, profileImg].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            profileImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            profileImg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImg.widthAnchor.constraint(equalToConstant: 40),
            profileImg.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
