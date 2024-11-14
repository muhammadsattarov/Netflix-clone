//
//  YoutubeSearchResponse.swift
//  Netflix
//
//  Created by user on 13/03/24.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideo
}

struct IdVideo: Codable {
    let kind: String
    let videoId: String
}
