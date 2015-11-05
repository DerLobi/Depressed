//
//  ORKTextChoiceExtensions.swift
//  Depressed?
//
//  Created by Christian Lobach on 27/10/15.
//  Copyright © 2015 Christian Lobach. All rights reserved.
//

import ResearchKit

public enum PHQ9ChoiceValue: Int {
    case NotAtAll = 0
    case SeveralDays = 1
    case MoreThanHalfTheDays = 2
    case NearlyEveryDay = 3
}

extension ORKTextChoice {

    class func phq9Choices() -> [ORKTextChoice] {
        return [
            ORKTextChoice(text: NSLocalizedString("choice_not_at_all", comment: ""), value: PHQ9ChoiceValue.NotAtAll.rawValue),
            ORKTextChoice(text: NSLocalizedString("choice_several_days", comment: ""), value: PHQ9ChoiceValue.SeveralDays.rawValue),
            ORKTextChoice(text: NSLocalizedString("choice_more_than_half_the_days", comment: ""), value: PHQ9ChoiceValue.MoreThanHalfTheDays.rawValue),
            ORKTextChoice(text: NSLocalizedString("choice_nearly_every_day", comment: ""), value: PHQ9ChoiceValue.NearlyEveryDay.rawValue)
        ]
    }
    
}
