//
//  SongDetailViewController.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/7/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import UIKit
import SDWebImage

class SongDetailViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var songLyricsLabel: UILabel!
    
    //MARK: Properties
    var songDetailViewModel: SongDetailViewModel!
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func bindViewModel() {
        let imageURL = NSURL(string: songDetailViewModel.imageURL)
        let placeHolder = UIImage(named: "placeholder")
        songImageView.sd_setImageWithURL(imageURL, placeholderImage: placeHolder)
        
        songNameLabel.text = songDetailViewModel.title
        artistNameLabel.text = songDetailViewModel.subtitile
        songLyricsLabel.text = songDetailViewModel.songLyrics
    }
}
