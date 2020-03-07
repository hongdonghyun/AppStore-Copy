//
//  Seperator.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/05.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class Seperator: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .quaternaryLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
