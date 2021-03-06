//
//  MainViewModel.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/6/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import Foundation

class MainViewModel {
    //MARK: Properties
    private var mood: Mood
    private var songs: [Song]
    var page: Int
    
    //MARK: Init method
    init(withMood mood: Mood) {
        self.mood = mood
        songs = []
        page = 0
    }
    
    //Fetch data from server to viewModel
    func getSongs(completionHandler: (success: Bool) -> Void) {
        WebServices.sharedInstance.getSongs(mood, page: page) { [unowned self] (result) in
            switch result {
            case .Success(let songs):
                self.songs = songs
                completionHandler(success: true)
            case .Failure(let error):
                print("Error when loading songs \(error)")
                completionHandler(success: false)
            }
        }
    }
    
    //Load more songs
    func loadMoreSongs(completionHandler: () -> Void) {
        WebServices.sharedInstance.getSongs(mood, page: page) { [unowned self] (result) in
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
        return songs[indexPath.row]
    }
    
}
