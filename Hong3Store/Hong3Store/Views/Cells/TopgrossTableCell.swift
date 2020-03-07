//
//  TopgrossTableCell.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/05.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class TopgrossTableCell: UITableViewCell {
    static let identifier = "TopgrossTableCell"
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

extension TopgrossTableCell {
    private func setupLayout() {
        guard let layout = self.collectionView.collectionViewLayout as? SnapCenterLayout else { return }
        let margin: CGFloat = 20
        let itemCount: CGFloat = 3
        let frameWidth = self.frame.width
        let contentWidth: CGFloat = frameWidth - (margin * 2)

        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        layout.itemSize = CGSize(width: contentWidth, height: 210 / itemCount)
    }
    
    private func setupUI() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(TopgrossCollectionCell.self, forCellWithReuseIdentifier: TopgrossCollectionCell.identifier)
        
        self.contentView.addSubview(self.collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}

extension TopgrossTableCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = resultArray?[indexPath.row] else { return }
        if delegate != nil {
            delegate?.cellTapped(itemId: item.id)
        }
    }
}

extension TopgrossTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopgrossCollectionCell.identifier, for: indexPath) as? TopgrossCollectionCell else {
            return UICollectionViewCell()
        }
        if let resultArray = resultArray, !resultArray.isEmpty {
            let item = resultArray[indexPath.row]
            cell.configure(title: item.name, subTitle: item.artistName, imageURL: item.artworkUrl100)
        }
        return cell
    }
    
    
}
