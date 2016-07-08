//
//  IntroViewModel.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/6/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import Foundation

struct IntroViewModel {
    //MARK: Properties
    var rateValue: Float {
        didSet {
            mood = Mood.getMoodFromRateValue(rateValue)
        }
    }
    
    var mood: Mood
    
    //MARK: Init method
    init() {
        rateValue = 5.0
        mood = Mood.getMoodFromRateValue(rateValue)
    }
}
