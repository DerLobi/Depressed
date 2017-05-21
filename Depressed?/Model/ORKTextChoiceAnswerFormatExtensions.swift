import ResearchKit

extension ORKTextChoiceAnswerFormat {

    ///  Answer format with the PHQ-9 text choices and a single choice style.
    @nonobjc
    static let phq9Format: ORKTextChoiceAnswerFormat = ORKTextChoiceAnswerFormat(style: .singleChoice, textChoices: ORKTextChoice.phq9Choices)

}
