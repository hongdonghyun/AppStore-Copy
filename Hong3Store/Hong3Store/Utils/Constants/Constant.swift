//
//  Constant.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/02/28.
//  Copyright © 2020 hong3. All rights reserved.
//

import Foundation

struct Constants {
    static let baseUrl = "rss.itunes.apple.com"
    static let detailBaseUrl = "itunes.apple.com"
    static let detailUrl = "/api/v1/kr/ios-apps"
    
    enum EndPoint: String {
        case appInfo = "/lookup"
        case freeAll = "/top-free/all"
        case freeGame = "/top-free/games"
        case newApps = "/new-apps-we-love/all"
        case newGames = "/new-games-we-love/all"
        case topgross = "/top-grossing/all"
        case paidAll = "/top-paid/all"
        case paidGames = "/top-paid/games"
    }
    
    enum pagination: String {
        case ten = "/10/explicit.json"
        case quarter = "/25/explicit.json"
        case half = "/50/explicit.json"
        case hundred = "/100/explicit.json"
    }
    
    enum RequestMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
}
