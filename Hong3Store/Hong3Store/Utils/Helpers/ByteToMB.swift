//
//  ByteToMB.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/10.
//  Copyright © 2020 hong3. All rights reserved.
//

import Foundation

// (convertInt64 / 1_024) / 1_024
func byteToMB(_ input: String) -> String {
    guard let convertInt64 = Int64(input) else { return "0" }
    return ByteCountFormatter.string(fromByteCount: convertInt64, countStyle: .file)
}
