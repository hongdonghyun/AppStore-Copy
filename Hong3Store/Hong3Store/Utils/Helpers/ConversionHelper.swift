//
//  ConversionHelper.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/11.
//  Copyright © 2020 hong3. All rights reserved.
//

import Foundation

func strArrToStr(_ input: [String]) -> String { input.joined(separator: ", ") }

// (convertInt64 / 1_024) / 1_024
func byteToMB(_ input: String) -> String {
    guard let convertInt64 = Int64(input) else { return "0" }
    return ByteCountFormatter.string(fromByteCount: convertInt64, countStyle: .file)
}

func daysBetween(start: Date, end: Date) -> Int {
    return Calendar.current.dateComponents([.day], from: start, to: end).day!
}

func digitDivider(_ input: Int) -> String {
    let strInt = "\(input)"
    if strInt.count >= 5 {
        return String(NSString(format: "%.1f만개의 평가", Double(input) * 0.0001))
    } else if strInt.count == 4 {
        return String(NSString(format: "%.1f천개의 평가", Double(input) * 0.001))
    } else { return String("\(input)개의 평가") }
    
}
