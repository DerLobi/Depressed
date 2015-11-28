import ResearchKit

extension ORKTextChoiceAnswerFormat {
    
    class func phq9Format() -> ORKTextChoiceAnswerFormat {
        return ORKTextChoiceAnswerFormat(style: .SingleChoice, textChoices: ORKTextChoice.phq9Choices())
    }
}
