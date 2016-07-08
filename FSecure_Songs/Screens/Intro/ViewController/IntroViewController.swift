//
//  IntroViewController.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/6/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import UIKit
import TTGEmojiRate

class IntroViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var emojiRateView: EmojiRateView!
    @IBOutlet weak var moodLabel: UILabel!
    
    //MARK: Properties
    var introViewModel: IntroViewModel = IntroViewModel()
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiRateView.rateValueChangeCallback = {(rateValue: Float) -> Void in
            self.introViewModel.rateValue = rateValue
            self.moodLabel.text = self.introViewModel.mood.rawValue
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Set portait mode for this view controller
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}

extension IntroViewController {
    //MARK: Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Route.FromIntroToMain.identifier {
            let mainViewModel = MainViewModel(withMood: introViewModel.mood)
            let mainNavigationController = segue.destinationViewController as! UINavigationController
            let mainTableViewController = mainNavigationController.viewControllers.first as! MainTableViewController
            mainTableViewController.mainViewModel = mainViewModel
        }
    }
}
