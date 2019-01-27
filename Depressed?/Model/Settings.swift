//
//  Settings.swift
//  Depressed?
//
//  Created by Christian Lobach on 27.01.19.
//  Copyright © 2019 Christian Lobach. All rights reserved.
//

import UIKit

/// Types conforming to this protocol can store and retrieve local settings
public protocol SettingsProtocol: class {
    /// The number of times a user has completed the survey
    var numberOfFinishedSurveys: Int { get set }
    /// Whether the system was asked to request a rating from the user
    var didShowRatingPrompt: Bool { get set }
    /// increments `numberOfFinishedSurveys` by one
    func incrementNumberOfFinishedSurveys()
}

/// An implementation of `SettingsProtocol` that uses the `UserDefaults`
class Settings: SettingsProtocol {

    private let finishedSurveysUserDefaultsKey = "finishedSurveys"
    private let didShowRatingUserDefaultsKey = "didShowRatingPrompt"

    var numberOfFinishedSurveys: Int {
        get {
            return UserDefaults.standard.integer(forKey: finishedSurveysUserDefaultsKey)
        }

        set {
            UserDefaults.standard.set(newValue, forKey: finishedSurveysUserDefaultsKey)
        }
    }

    var didShowRatingPrompt: Bool {
        get {
            return UserDefaults.standard.bool(forKey: didShowRatingUserDefaultsKey)
        }

        set {
            UserDefaults.standard.set(newValue, forKey: didShowRatingUserDefaultsKey)
        }
    }

    func incrementNumberOfFinishedSurveys() {
        numberOfFinishedSurveys += 1
    }
}
