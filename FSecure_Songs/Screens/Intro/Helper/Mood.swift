//
//  Mood.swift
//  FSecure_Songs
//
//  Created by Hai Phan on 7/6/16.
//  Copyright © 2016 Hai Phan. All rights reserved.
//

import Foundation

enum Mood: String {
    case Happy   = "Happy"
    case Hopeful = "Hopeful"
    case Bored   = "Bored"
    case Worried = "Worried"
    case Sad     = "Sad"
}

extension Mood {
    static func getMoodFromRateValue(rateValue: Float) -> Mood {
        if (rateValue >= 0) && (rateValue < 1) {
            return .Sad
        } else if (rateValue >= 1) && (rateValue < 2) {
            return .Worried
        } else if (rateValue >= 2) && (rateValue < 3) {
            return .Bored
        } else if (rateValue >= 3) && (rateValue < 4) {
            return .Hopeful
        } else {
            return .Happy
        }
    }
}