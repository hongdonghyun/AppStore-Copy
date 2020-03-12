//
//  starPrint.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/12.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

func starPrint(_ input: Double) -> String {
    let emptyStar = "☆"
    let fillStar = "★"
    var resultStr = ""
    var tempInput = input
    for _ in 0..<5 {
        if tempInput >= 1 {
            resultStr += fillStar
        } else if tempInput >= 0.5 {
            resultStr += emptyStar
        }
        tempInput -= 1
    }
    return resultStr
}
