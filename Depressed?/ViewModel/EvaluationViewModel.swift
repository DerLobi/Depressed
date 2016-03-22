import Foundation

///  Viewmodel transforming `Evaluation` model data for presentation to the user.
public struct EvaluationViewModel {

    /// Diagnosis of how severe the depression is.
    public let diagnosis: String

    /// Phrase describing the diagnosis.
    public let diagnosisText: String

    /// Explanation that relates the users answers to the diagnosis.
    public let explanationText: String

    /// Warning message in case the user answered that they had thoughts
    /// about suicide or self harm.
    public let suicidalText: String?

    /// The total score of the user's answers.
    public let score: String

    /// Whether the score should be displayed. If a depressive disorder is not
    /// considered, we don't want to display the score.
    public let shouldDisplayScore: Bool

    /// The titles of the questions the user has answered and the corresponding score.
    public let answers: [(String, String)]

    /// The viewmodel for the 'Find Help' information.
    public let findingHelpViewModel: FindingHelpViewModel?

    /// Whether or not to display the 'Find Help' information.
    public var shouldDisplayFindingHelpInformation: Bool {
        return findingHelpViewModel != nil
    }
    
    ///  Creates a new view model from the given evaluation.
    ///
    ///  - parameter evaluation:             An `Evaluation`.
    ///  - parameter findingHelpInformation: A `FindingHelpInformation` or `nil` if none is available.
    ///
    ///  - returns: a newly initialized `EvaluationViewModel` instance
    public init(evaluation: EvaluationType, findingHelpInformation: FindingHelpInformation?) {

        if let findingHelpInformation = findingHelpInformation {
            findingHelpViewModel = FindingHelpViewModel(info: findingHelpInformation)
        } else {
            findingHelpViewModel = nil
        }

        if evaluation.depressiveDisorderConsidered {

            explanationText = NSLocalizedString("explanation_depression", comment: "")

            switch evaluation.severity {
            case .NoDepression:
                diagnosis = NSLocalizedString("diagnosis_no_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_no_depression", comment: "")
            case .MinimalDepression:
                diagnosis = NSLocalizedString("diagnosis_minimal_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_minimal_depression", comment: "")
            case .MildDepression:
                diagnosis = NSLocalizedString("diagnosis_mild_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_mild_depression", comment: "")
            case .ModerateDepression:
                diagnosis = NSLocalizedString("diagnosis_moderate_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_moderate_depression", comment: "")
            case .ModeratelySevereDepression:
                diagnosis = NSLocalizedString("diagnosis_moderately_severe_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_moderately_severe_depression", comment: "")
            case .SevereDepression:
                diagnosis = NSLocalizedString("diagnosis_severe_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_severe_depression", comment: "")
            }
        } else {
            diagnosis = NSLocalizedString("diagnosis_no_depression", comment: "")
            diagnosisText = NSLocalizedString("diagnosis_text_no_depression", comment: "")

            if evaluation.numberOfAnswersCritical {
                explanationText = NSLocalizedString("explanation_no_depression_first_questions_not_critical", comment: "")
            } else {
                explanationText = NSLocalizedString("explanation_no_depression_not_enough_answers_critical", comment: "")
            }
        }

        if evaluation.suicidal {
            suicidalText = NSLocalizedString("suicidal_text", comment: "")
        } else {
            suicidalText = nil
        }

        shouldDisplayScore = evaluation.depressiveDisorderConsidered

        score = String(evaluation.score)

        answers = evaluation.answers.map { ($0.question.title, String($0.answerScore.rawValue)) }
    }

}
