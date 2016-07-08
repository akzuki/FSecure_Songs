//
//  FSecureSongsAPI.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/8/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import Foundation

enum FSecureSongAPI {
    case GetSongs
}

extension FSecureSongAPI {
    private var baseURL: String {
        return "https://fsecure-songs.herokuapp.com/api/v1"
    }
    
    var URLpath: String {
        switch self {
        case .GetSongs:
            return "\(baseURL)/songs/"
        }
    }
}