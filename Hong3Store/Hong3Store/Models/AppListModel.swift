//
//  AppListModel.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/02.
//  Copyright © 2020 hong3. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct AppStoreModel: Decodable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Decodable {
    let results: [AppResult]
}

// MARK: - ResultItem
struct AppResult: Decodable {
    let artistName, id, name: String
    let kind: Kind
    let copyright, artistID: String
    let artistURL: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String

    enum CodingKeys: String, CodingKey {
        case artistName, id, name, kind, copyright
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url
    }
}

// MARK: - Genre
struct Genre: Decodable {
    let genreID, name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Codable {
    case iosSoftware = "iosSoftware"
    case mobileSoftwareBundle = "mobileSoftwareBundle"
}
