//
//  Constant.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/02/28.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

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
    
    enum CustomText: String {
        case bold40
        case bold30
        case bold26
        case bold20
        case medium40
        case medium30
        case medium20
        case medium16
        case light40
        case light30
        case light20
        case light16
    }
}

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

