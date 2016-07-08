//
//  SongPresentableProtocol.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/7/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import Foundation

protocol SongPresentableProtocol {
    var songLyrics: String {get}
}

protocol TextPresentableProtocol {
    var title: String {get}
    var subtitile: String {get}
}

protocol ImagePresentableProtocol {
    var imageURL: String {get}
}

//Default
extension SongPresentableProtocol {
    var songLyrics: String {
        return "Lyrics goes here"
    }
}

extension TextPresentableProtocol {
    var title: String {
        return "Song Name"
    }
    var subtitile: String {
        return "Artist Name"
    }
}

extension ImagePresentableProtocol {
    var imageURL: String {
        return "placeholder"
    }
}