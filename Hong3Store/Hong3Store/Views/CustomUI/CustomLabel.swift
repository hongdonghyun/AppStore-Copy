//
//  CustomLabel.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/11.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class BlackLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = .black
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GrayLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LinkLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = .link
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
