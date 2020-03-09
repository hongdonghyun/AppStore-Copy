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
    let contentAdvisoryRating: String
    let trackContentRating: String
    let trackName: String
    let genres: [String]
    let minimumOSVersion, sellerName: String
    let averageUserRating: Double
    let userRatingCount: Int
    let version: String
    let currentVersionReleaseDate: Date
    let appDescription: String
//    let genreIDS: [String]
//    let artistViewURL: String
//    let supportedDevices: [String]
//    let kind, trackCensoredName: String
//    let languageCodesISO2A: [String]
//    let fileSizeBytes: String
//    let sellerURL: String
//    let trackViewURL: String
//    let trackID: Int
//    let formattedPrice, primaryGenreName: String
//    let isVppDeviceBasedLicensingEnabled: Bool
//    let releaseDate: Date
//    let releaseNotes: String
//    let primaryGenreID: Int
//    let artistID: Int
//    let artistName: String
//    let price: Int
//    let bundleID: String

    enum CodingKeys: String, CodingKey {
        case screenshotUrls, artworkUrl100
        case releaseNotes
        case contentAdvisoryRating
        case trackContentRating
        case trackName
        case genres
        case minimumOSVersion = "minimumOsVersion"
        case sellerName
        case averageUserRating
        case userRatingCount
        case version
        case currentVersionReleaseDate
        case appDescription = "description"
        //        case genreIDS = "genreIds"
//        case artistViewURL = "artistViewUrl"
//        case supportedDevices, kind, trackCensoredName, languageCodesISO2A, fileSizeBytes
//        case sellerURL = "sellerUrl"
//        case trackViewURL = "trackViewUrl"
//        case trackID = "trackId"
//        case formattedPrice, primaryGenreName, isVppDeviceBasedLicensingEnabled, releaseDate
//        case primaryGenreID = "primaryGenreId"
//        case artistID = "artistId"
//        case artistName
//        case price
//        case bundleID = "bundleId"
    }
}
