//
//  DetailViewRoot.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/07.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DetailViewRoot: UIView {
    let tableView = DetailTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailViewRoot {
    private func setupUI() {
        let safeArea = self.safeAreaLayoutGuide
        
        [tableView].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}
