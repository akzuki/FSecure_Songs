//
//  Route.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/6/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import Foundation


//Route: A list of all segue identifiers used in the app. To avoid using raw string.

enum Route {
    case FromIntroToMain
    case FromMainToDetail
}

extension Route {
    var identifier: String {
        switch self {
        case .FromIntroToMain:
            return "showSongList"
        case .FromMainToDetail:
            return "showSongDetail"
        }
    }
}