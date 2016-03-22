import ResearchKit

///  An answer the user has give to a particular question.
public struct Answer {

    /// The answered question.
    public let question: Question

    /// The answer the user has chosen to the question.
    public let answerScore: PHQ9ChoiceValue

    ///  Creates an `Answer` from an `ORKStepResult`.
    ///
    ///  - parameter stepResult: a `ORKStepResult` obtained from a `ORKTaskViewController`.
    ///
    ///  - returns: A newly initialized Answer or `nil`.
    public init?(stepResult: ORKStepResult) {
        guard let result = stepResult.firstResult as? ORKChoiceQuestionResult,
            value = result.choiceAnswers?.first as? NSNumber,
            score = PHQ9ChoiceValue(rawValue: value.integerValue),
            identifier = QuestionIdentifier(rawValue: stepResult.identifier) else { return nil }

        answerScore = score

        question = Question(identifier: identifier)
    }
}
