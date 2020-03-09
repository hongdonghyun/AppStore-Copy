//
//  AppInfoModel.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/02/28.
//  Copyright © 2020 hong3. All rights reserved.
//

import Foundation

struct AppInfo: Decodable {
    let results: [InfoResult]
}

struct InfoResult: Decodable {
    let screenshotUrls: [String]
    let artworkUrl100: String
    let releaseNotes: String?
//    let artistViewURL: String
//    let supportedDevices: [String]
//    let kind, trackCensoredName: String
//    let languageCodesISO2A: [String]
//    let fileSizeBytes: String
//    let sellerURL: String
//    let contentAdvisoryRating: String
//    let trackViewURL: String
//    let trackContentRating: String
//    let trackID: Int
//    let trackName: String
//    let genreIDS: [String]
//    let formattedPrice, primaryGenreName: String
//    let isVppDeviceBasedLicensingEnabled: Bool
//    let releaseDate: Date
//    let minimumOSVersion, sellerName: String
//    let currentVersionReleaseDate: Date
//    let releaseNotes: String
//    let primaryGenreID: Int
//    let currency, version: String
//    let artistID: Int
//    let artistName: String
//    let genres: [String]
//    let price: Int
//    let resultDescription, bundleID: String
//    let averageUserRating: Double
//    let userRatingCount: Int

    enum CodingKeys: String, CodingKey {
        case screenshotUrls, artworkUrl100
        case releaseNotes
//        case artistViewURL = "artistViewUrl"
//        case supportedDevices, kind, trackCensoredName, languageCodesISO2A, fileSizeBytes
//        case sellerURL = "sellerUrl"
//        case contentAdvisoryRating
//        case trackViewURL = "trackViewUrl"
//        case trackContentRating
//        case trackID = "trackId"
//        case trackName
//        case genreIDS = "genreIds"
//        case formattedPrice, primaryGenreName, isVppDeviceBasedLicensingEnabled, releaseDate
//        case minimumOSVersion = "minimumOsVersion"
//        case sellerName, currentVersionReleaseDate
//        case primaryGenreID = "primaryGenreId"
//        case currency, version
//        case artistID = "artistId"
//        case artistName, genres, price
//        case resultDescription = "description"
//        case bundleID = "bundleId"
//        case averageUserRating, userRatingCount
    }
}
