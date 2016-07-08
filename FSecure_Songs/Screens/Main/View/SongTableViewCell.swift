//
//  SongTableViewCell.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/5/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import UIKit
import SDWebImage

class SongTableViewCell: UITableViewCell, ReusableCell {
    //MARK: IBOutlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var playButton: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //Configure cell with song
    func configure(withSong song: Song) {
        let imageURL = NSURL(string: song.songThumbnailUrl)
        let placeHolder = UIImage(named: "placeholder")
        backgroundImage.sd_setImageWithURL(imageURL, placeholderImage: placeHolder)
        songName.text = song.songName
        artistName.text = song.artistName
    }

}
