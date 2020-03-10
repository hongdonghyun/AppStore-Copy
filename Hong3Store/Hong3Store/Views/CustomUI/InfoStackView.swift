//
//  InfoStackView.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/09.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit


class InfoStackView: UIStackView {
    private let titleArray: [String] = ["제공자", "크기", "카테고리", "호환성", "언어", "연령 등급"]
    let stackViewSpacing: CGFloat = 10
    var contentArray: [String] = ["", "", "", "", "", "", ""]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoStackView {
    func configure(contentArray contents: [String]) {
        contentArray = contents
    }
}

extension InfoStackView {
    private func setupUI() {
        var horizontalStackViewArray = [UIStackView]()
        for i in 0..<titleArray.count {
            let titleLabel = UILabel()
            let textLabel = UILabel()
            titleLabel.text = titleArray[i]
            titleLabel.textColor = .gray
            titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            
            textLabel.numberOfLines = 2
            textLabel.tag = 9999 - i
            textLabel.textAlignment = .right
            textLabel.text = contentArray[i]

            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.addArrangedSubview(titleLabel)
            stackView.addArrangedSubview(textLabel)
            
            horizontalStackViewArray.append(stackView)
        }
        
        
        horizontalStackViewArray.forEach {
            self.addArrangedSubview($0)
            let view = Seperator()
            view.heightAnchor.constraint(equalToConstant: 1).isActive = true
            self.addArrangedSubview(view)
        }
        
        self.axis = .vertical
        self.spacing = stackViewSpacing
        
    }
}
