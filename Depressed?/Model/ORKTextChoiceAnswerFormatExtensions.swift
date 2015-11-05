//
//  ORKTextChoiceAnswerFormatExtensions.swift
//  Depressed?
//
//  Created by Christian Lobach on 27/10/15.
//  Copyright © 2015 Christian Lobach. All rights reserved.
//

import ResearchKit

extension ORKTextChoiceAnswerFormat {
    
    class func phq9Format() -> ORKTextChoiceAnswerFormat {
        return ORKTextChoiceAnswerFormat(style: .SingleChoice, textChoices: ORKTextChoice.phq9Choices())
    }
}
