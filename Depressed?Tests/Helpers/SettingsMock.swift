//
//  SettingsMock.swift
//  Depressed?Tests
//
//  Created by Christian Lobach on 27.01.19.
//  Copyright © 2019 Christian Lobach. All rights reserved.
//

import Depressed

class SettingsMock: SettingsProtocol {

    var numberOfFinishedSurveys: Int = 0

    var didShowRatingPrompt: Bool = false

    func incrementNumberOfFinishedSurveys() {
        numberOfFinishedSurveys += 1
    }
}
