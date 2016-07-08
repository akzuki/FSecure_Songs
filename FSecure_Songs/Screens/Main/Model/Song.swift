//
//  Song.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/6/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import Foundation
import ObjectMapper

class Song: Mappable {
    var songName: String!
    var artistName: String!
    var songThumbnailUrl: String!
    var songLyrics: String!
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        songName <- map["song_name"]
        artistName <- map["artist_name"]
        songThumbnailUrl <- map["song_thumbnail_url"]
        songLyrics <- map["song_lyrics"]
    }
    
}