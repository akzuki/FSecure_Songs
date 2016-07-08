//
//  WebServices.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/7/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

enum Result<T> {
    case Success(T)
    case Failure(ErrorType?)
}

class WebServices {
    static let sharedInstance = WebServices()
    
    //MARK: Get songs
    func getSongs(mood: Mood, page: Int, completionHandler: Result<[Song]> -> Void) {
        let URLString = FSecureSongAPI.GetSongs.URLpath
        let params = [
            "song_mood": mood.rawValue.lowercaseString,
            "page": String(page)
        ]
        Alamofire.request(.GET, URLString, parameters: params, headers: nil)
            .responseArray { (response: Response<[Song], NSError>) in
                guard response.result.isSuccess else {
                    completionHandler(.Failure(response.result.error))
                    return
                }
                if let result = response.result.value {
                    completionHandler(.Success(result))
                }
        }
    }
}
