//
//  UITableViewExtension.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/11.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

extension UITableView {
    convenience init(style: UITableView.Style = .grouped, backgroundColor: UIColor = .white) {
        self.init(frame: .zero, style: style)
        self.separatorStyle = .none
        self.allowsSelection = false
        self.backgroundColor = backgroundColor
    }
}
