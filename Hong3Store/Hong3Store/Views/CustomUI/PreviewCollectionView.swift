//
//  PreviewCollectionView.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/05.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class PreviewCollectionView: UICollectionView {
    static let identifier = "PreviewCollectionView"
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .clear
        self.decelerationRate = UIScrollView.DecelerationRate.fast
        self.showsHorizontalScrollIndicator = false
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
