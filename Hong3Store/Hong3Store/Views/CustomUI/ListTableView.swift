//
//  ListTableView.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/02.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class ListTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        self.separatorStyle = .none
        self.allowsSelection = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
