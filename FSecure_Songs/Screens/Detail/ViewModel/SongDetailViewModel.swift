//
//  SongDetailViewModel.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/7/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import Foundation

typealias SongDetailProtocol = protocol<SongPresentableProtocol, ImagePresentableProtocol, TextPresentableProtocol>

struct SongDetailViewModel: SongDetailProtocol {
    //MARK: Model
    let songModel: Song
    
    //MARK: Properties/Protocols
    var title: String {
        return songModel.songName
    }
    var subtitile: String {
        return songModel.artistName
    }
    var songLyrics: String {
        return songModel.songLyrics
    }
    var imageURL: String {
        return songModel.songThumbnailUrl
    }
    
    //MARK: Init method
    init(songModel: Song) {
        self.songModel = songModel
    }
}
