//
//  DetailTableView.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/07.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DetailTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        self.separatorStyle = .none
        self.allowsSelection = false
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
