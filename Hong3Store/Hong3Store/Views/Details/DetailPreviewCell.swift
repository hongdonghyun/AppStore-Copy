//
//  DetailPreviewCell.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/07.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DetailPreviewCell: UITableViewCell {
    static let identifier = "DetailPreviewCell"
    private var imgUrlArray: [String]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "미리보기"
        label.font = .systemFont(ofSize: 23)
        return label
    }()
    private let collectionView = PreviewCollectionView(frame: .zero, collectionViewLayout: SnapCenterLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailPreviewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imgUrlArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailPreviewCollectionCell.identifier, for: indexPath) as? DetailPreviewCollectionCell else { return UICollectionViewCell() }
        guard let imgUrl = imgUrlArray?[indexPath.item] else { return UICollectionViewCell() }
        cell.configure(imgUrl: imgUrl)
        return cell
    }
    
    
}

extension DetailPreviewCell {
    func configure(imgUrlArray iArray: [String]) {
        imgUrlArray = iArray
    }
}

extension DetailPreviewCell {
    private func setupLayout() {
        guard let layout = self.collectionView.collectionViewLayout as? SnapCenterLayout else { return }
        let margin: CGFloat = 20
        let itemCount: CGFloat = 1.5
        let frameWidth = self.frame.width
        let contentWidth: CGFloat = frameWidth - (margin * 2) - (10 * (itemCount - 1))
        let itemWidth: CGFloat = (contentWidth / itemCount).rounded(.down)
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        layout.itemSize = CGSize(width: itemWidth, height: 400)
    }
    
    private func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.register(DetailPreviewCollectionCell.self, forCellWithReuseIdentifier: DetailPreviewCollectionCell.identifier)
    }
    
    private func setupUI() {
        setupCollectionView()
        
        [collectionView, titleLabel].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 410)
        ])
    }
}
