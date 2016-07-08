//
//  MainTableViewController.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/5/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import UIKit
import EZLoadingActivity

class MainTableViewController: UITableViewController {
    
    //MARK: Properties
    var mainViewModel: MainViewModel!
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EZLoadingActivity.show("Loading songs", disableUI: true)
        //Get songs
        self.mainViewModel.getSongs({ (success: Bool) in
            dispatch_async(dispatch_get_main_queue(), {
                EZLoadingActivity.hide(success: success, animated: true)
                self.tableView.reloadData()
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension MainTableViewController {
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.mainViewModel.numberOfSections()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainViewModel.numberOfRowInSections()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(SongTableViewCell.self, indexPath: indexPath)
        let song = mainViewModel.itemAtIndexPath(indexPath)
        cell.configure(withSong: song)
        
        return cell
    }
}

extension MainTableViewController {
    // MARK: - Table view delegate
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UIScreen.mainScreen().bounds.size.width * 9 / 16 + 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        //Execute load more function
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if maximumOffset - currentOffset <= 25.0 {
            self.mainViewModel.page += 1
            self.mainViewModel.loadMoreSongs({ 
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
            })
        }
    }
}

extension MainTableViewController {
    // MARK: - Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Route.FromMainToDetail.identifier {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(cell) {
                let song = mainViewModel.itemAtIndexPath(indexPath)
                let songDetailViewModel = SongDetailViewModel(songModel: song)
                let songDetailVC = segue.destinationViewController as! SongDetailViewController
                songDetailVC.songDetailViewModel = songDetailViewModel
            }
        }
    }
}
