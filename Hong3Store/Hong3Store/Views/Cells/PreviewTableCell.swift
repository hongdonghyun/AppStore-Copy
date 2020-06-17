//
//  PreviewTableCell.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/05.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class PreviewTableCell: UITableViewCell {
    static let identifier = "PreviewTableCell"
    weak var delegate: CollectionCellDidSelected?
    var resultArray: [AppResult]? {
        didSet {
            collectionView.reloadData()
        }
    }
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

extension PreviewTableCell {
    private func setupLayout() {
        guard let layout = self.collectionView.collectionViewLayout as? SnapCenterLayout else { return }
            let margin: CGFloat = 20
            let itemCount: CGFloat = 1
            let frameWidth = self.frame.width
            let contentWidth: CGFloat = frameWidth - (margin * 2) - (10 * (itemCount - 1))
            let itemWidth: CGFloat = (contentWidth / itemCount).rounded(.down)
        
            layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
            layout.itemSize = CGSize(width: itemWidth, height: 230)
    }
    
  
    private func setupUI() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(PreviewCollectionCell.self, forCellWithReuseIdentifier: PreviewCollectionCell.identifier)
        
        self.contentView.addSubview(self.collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
}


extension PreviewTableCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = resultArray?[indexPath.row] else { return }
        if delegate != nil {
            delegate?.cellTapped(itemId: item.id, title: item.name, rank: indexPath.item)
        }
    }
    
}



extension PreviewTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        resultArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCollectionCell.identifier, for: indexPath) as? PreviewCollectionCell else { return UICollectionViewCell() }
        if let resultArray = resultArray, !resultArray.isEmpty {
            let item = resultArray[indexPath.row]
            cell.configure(title: item.name, subTitle: item.artistName, imageURL: item.artworkUrl100)
        }
        return cell
    }
    
    
}
