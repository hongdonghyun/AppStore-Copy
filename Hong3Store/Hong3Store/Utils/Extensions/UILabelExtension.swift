//
//  UILabelExtension.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/11.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String) {
        self.init()
        self.text = text
    }
    
    func getTextSize(type: Constants.CustomText) {
        switch type {
        case .bold40:
            self.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        case .bold30:
            self.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        case .bold26:
            self.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        case .bold20:
            self.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        case .medium40:
            self.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        case .medium30:
            self.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        case .medium20:
            self.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        case .medium16:
            self.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        case .light40:
            self.font = UIFont.systemFont(ofSize: 40, weight: .light)
        case .light30:
            self.font = UIFont.systemFont(ofSize: 30, weight: .light)
        case .light20:
            self.font = UIFont.systemFont(ofSize: 20, weight: .light)
        case .light16:
            self.font = UIFont.systemFont(ofSize: 15, weight: .light)
        }
        
    }
}
