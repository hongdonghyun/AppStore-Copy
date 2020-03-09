//
//  InfoStackView.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/09.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class InfoStackView: UIStackView {
    private let titleArray: [String] = ["제공자", "크기", "카테고리", "호환성", "언어", "연령 등급", "저작권", "개발자 웹 사이트"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension InfoStackView {
    private func setupUI() {
        var horizontalStackViewArray = [UIStackView]()
        titleArray.forEach {
            let titleLabel = UILabel()
            titleLabel.text = $0
            titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            
            
            let textLabel = UILabel()
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.addArrangedSubview(titleLabel)
            stackView.addArrangedSubview(textLabel)
            
            horizontalStackViewArray.append(stackView)
        }
        stride(from: 1, to: (titleArray.count * 2) - 1, by: 2).forEach {
            print($0)
        }
    }
}
