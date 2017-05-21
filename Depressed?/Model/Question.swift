import ResearchKit

///  A question the user answers.
public struct Question {

    /// The identifier of the question.
    public let identifier: QuestionIdentifier

    /// A headline summing up the question.
    public let title: String

    /// the complete text of the question.
    public let text: String

    /// An `ORKStep` representation, suitable to use with a `ORKTask`.
    public var step: ORKQuestionStep {
        let step = ORKQuestionStep(identifier: identifier.rawValue, title: title, answer: ORKTextChoiceAnswerFormat.phq9Format)
        step.text = text
        step.isOptional = false
        return step
    }

    ///  Creates a new `Question` from a `QuestionIdentifier`.
    ///
    ///  - parameter identifier: a question identifier.
    ///
    ///  - returns: A newly initialized Question.
    public init(identifier: QuestionIdentifier) {

        self.identifier = identifier

        switch identifier {
        case .losingInterest:
            title = NSLocalizedString("question_title_losing_interest", comment: "")
            text = NSLocalizedString("question_text_losing_interest", comment: "")
        case .feelingDepressed:
            title = NSLocalizedString("question_title_feeling_depressed", comment: "")
            text = NSLocalizedString("question_text_feeling_depressed", comment: "")
        case .troubleSleeping:
            title = NSLocalizedString("question_title_trouble_sleeping", comment: "")
            text = NSLocalizedString("question_text_trouble_sleeping", comment: "")
        case .feelingTired:
            title = NSLocalizedString("question_title_feeling_tired", comment: "")
            text = NSLocalizedString("question_text_feeling_tired", comment: "")
        case .poorAppetite:
            title = NSLocalizedString("question_title_poor_appetite", comment: "")
            text = NSLocalizedString("question_text_poor_appetite", comment: "")
        case .lowSelfEsteem:
            title = NSLocalizedString("question_title_low_self_esteem", comment: "")
            text = NSLocalizedString("question_text_low_self_esteem", comment: "")
        case .troubleConcentrating:
            title = NSLocalizedString("question_title_trouble_concentrating", comment: "")
            text = NSLocalizedString("question_text_trouble_concentrating", comment: "")
        case .slowOrFast:
            title = NSLocalizedString("question_title_slow_or_fast", comment: "")
            text = NSLocalizedString("question_text_slow_or_fast", comment: "")
        case .feelingSuicidal:
            title = NSLocalizedString("question_title_feeling_suicidal", comment: "")
            text = NSLocalizedString("question_text_feeling_suicidal", comment: "")
        }

    }

}
