//
//  DownloadButton.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/11.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DownloadButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("     받기     ", for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 20)
        self.backgroundColor = .quaternaryLabel
        self.setTitleColor(.systemBlue, for: .normal)
        self.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var url: URL? {
        didSet {
            self.addTarget(self, action: #selector(openAppStore(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func openAppStore(_ sender: UIButton) {
        guard let url = url else { return }
        UIApplication.shared.open(url, options: [:])
    }

}
