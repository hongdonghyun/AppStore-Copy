//
//  ButtonGradation.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/09.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

func gradation(_ sender: UILabel) {
    let gradient = CAGradientLayer()
    gradient.transform = CATransform3DMakeRotation(.pi / 2, 0, 0, 1)
    gradient.frame = sender.bounds
    gradient.colors = [UIColor.white.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.init(white: 1, alpha: 0.3).cgColor]
    
    sender.layer.insertSublayer(gradient, at: 0)
}
