//
//  DetailDescriptionCell.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/09.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DetailDescriptionCell: UITableViewCell {
    static let identifier = "DetailDescriptionCell"
    weak var delegate: DetailTableCellMoreBtnSelected?
    private let descrpitionView = UIView()
    private let infoView = UIView()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.lineBreakMode = .byClipping
        return label
    }()
    
    private lazy var moreBtn: UILabel = {
        let label = UILabel()
        let tap = UITapGestureRecognizer(target: self, action: #selector(moreBtnAction(_:)))
        label.text = "   더 보기 "
        label.textColor = .link
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .link
        return label
    }()
    
    private let developerLabel: UILabel = {
        let label = UILabel()
        label.text = "개발자"
        label.textColor = .gray
        return label
    }()
    
    private let chevronImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .gray
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        gradation(moreBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

}

extension DetailDescriptionCell {
    func configure(description appDescription: String, sellerName: String) {
        descriptionLabel.text = appDescription
        artistNameLabel.text = sellerName
    }
}

extension DetailDescriptionCell{
    @objc private func moreBtnAction(_ sender: UITapGestureRecognizer) {
        guard let delegate = delegate else { return }
        descriptionLabel.numberOfLines = 0
        moreBtn.isHidden = true
        delegate.cellTapped()
        
    }
    
}


extension DetailDescriptionCell {
    private func setupUI() {
        [descrpitionView, infoView].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            descrpitionView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            descrpitionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            descrpitionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            infoView.topAnchor.constraint(equalTo: descrpitionView.bottomAnchor, constant: 20),
            infoView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            infoView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            infoView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
        ])
        
        [descriptionLabel, moreBtn].forEach {
            descrpitionView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: descrpitionView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descrpitionView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descrpitionView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: descrpitionView.bottomAnchor),
            
            moreBtn.bottomAnchor.constraint(equalTo: descrpitionView.bottomAnchor),
            moreBtn.trailingAnchor.constraint(equalTo: descrpitionView.trailingAnchor)
        ])
        
        [artistNameLabel, developerLabel, chevronImage].forEach {
            infoView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            artistNameLabel.topAnchor.constraint(equalTo: infoView.topAnchor),
            artistNameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            artistNameLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
            
            developerLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 5),
            developerLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor),
            developerLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            developerLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
            
            chevronImage.centerYAnchor.constraint(equalTo: infoView.centerYAnchor),
            chevronImage.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
        ])
    }
}
