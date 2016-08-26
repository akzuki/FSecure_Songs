//
//  MainViewModel.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/6/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import Foundation

struct MainViewModel {
    //MARK: Properties
    private var mood: Mood
    var songs: [Song] = []
    var page: Int
    
    //MARK: Init method
    init(withMood mood: Mood) {
        self.mood = mood
        page = 0
    }
    
    //Fetch data from server to viewModel
    mutating func getSongs(completionHandler: (success: Bool) -> Void) {
        WebServices.sharedInstance.getSongs(mood, page: page) { (result) in
            switch result {
            case .Success(let songs):
                self.songs = songs
                //DMSTRUCT
                completionHandler(success: true)
            case .Failure(let error):
                print("Error when loading songs \(error)")
                completionHandler(success: false)
            }
        }
    }
    
    //Load more songs
    mutating func loadMoreSongs(completionHandler: () -> Void) {
        WebServices.sharedInstance.getSongs(mood, page: page) {(result) in
            switch result {
            case .Success(let songs):
                self.songs.appendContentsOf(songs)
            case .Failure(let error):
                print("Error when loading more songs \(error)")
            }
            completionHandler()
        }
    }
    
    //MARK: UITableView Datasource
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowInSections() -> Int {
        return songs.count
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> Song {
        return songs[indexPath.item]
    }
    
}
