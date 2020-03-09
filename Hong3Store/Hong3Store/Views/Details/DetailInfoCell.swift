//
//  DetailInfoCell.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/09.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DetailInfoCell: UITableViewCell {
    static let identifier = "DetailInfoCell"
    
    private let providerLabel: UILabel = {
        let label = UILabel()
        label.text = "제공자"
        label.textColor = .gray
        return label
    }()
    
    private let appSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "크기"
        label.textColor = .gray
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        label.textColor = .gray
        return label
    }()
    
    private let compatibilityLabel: UILabel = {
        let label = UILabel()
        label.text = "호환성"
        label.textColor = .gray
        return label
    }()
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "언어"
        label.textColor = .gray
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "연령등급"
        label.textColor = .gray
        return label
    }()
    
    private let copyrightLabel: UILabel = {
        let label = UILabel()
        label.text = "저작권"
        label.textColor = .gray
        return label
    }()
    
    private let provider: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let appSize: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let category: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let compatibility: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let language: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let age: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let copyright: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}

extension DetailInfoCell {
    private func setupUI() {
        
    }
}
