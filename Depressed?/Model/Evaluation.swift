import ResearchKit

///  Severity of the depression.
public enum Severity: String {

    ///  No depression.
    case NoDepression
    
    ///  Minimal depression.
    case MinimalDepression
    
    ///  Mild depression.
    case MildDepression

    ///  Moderate depression.
    case ModerateDepression
    
    ///  Moderately severe depression.
    case ModeratelySevereDepression

    ///  Severe depression.
    case SevereDepression    
}

///  Summed up results of taking the test.
public protocol EvaluationType {
    
    /// Whether a depressive disorder should be considered.
    var depressiveDisorderConsidered: Bool { get }
    
    /// Total score based on the value of the given answers.
    var score: Int { get }
    
    /// Severity of the diagnosed depression.
    var severity: Severity { get }
    
    /// Whether the user answered that they would be better off dead at least some of the time.
    var suicidal: Bool { get }
    
    /// Whether the user answered the question about losing interest with at least "more than half the days".
    var losingInterestCritical: Bool { get }
    
    /// Whether the user answered the question about feeling depressed with at least "more than half the days".
    var feelingDepressedCritical: Bool { get }
    
    /// Whether the user answered at least four questions with at least "more than half the days".
    var numberOfAnswersCritical: Bool { get }
}

///  Evaluation that presents the results based on `ORKStepResult`s.
public struct Evaluation: EvaluationType {
    
    /// Whether a depressive disorder should be considered.
    public private(set) var depressiveDisorderConsidered: Bool
    
    /// Total score based on the value of the given answers.
    public let score: Int
    
    /// Severity of the diagnosed depression.
    public let severity: Severity
    
    /// Whether the user answered that they would be better off dead at least some of the time.
    public private(set) var suicidal: Bool

    /// Whether the user answered the question about losing interest with at least "more than half the days".
    public private(set) var losingInterestCritical: Bool

    /// Whether the user answered the question about feeling depressed with at least "more than half the days".
    public private(set) var feelingDepressedCritical: Bool
    
    /// Whether the user answered at least four questions with at least "more than half the days".
    public private(set) var numberOfAnswersCritical: Bool

    ///  Creates an `Evaluation` from `ORKStepResult`s.
    ///
    ///  - parameter stepResults: Results of the result of a completed `ORKTaskViewController`.
    ///
    ///  ```swift
    ///  //MARK: - ORKTaskViewControllerDelegate
    ///
    ///  func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
    ///     if reason == .Completed, let results = taskViewController.result.results as? [ORKStepResult]{
    ///         let evaluation = Evaluation(stepResults: results)
    ///     }
    ///  }
    /// ```
    ///
    ///  - returns: A newly initialized Evaluation or `nil`.
    public init?(stepResults: [ORKStepResult]) {
        
        guard stepResults.count == QuestionIdentifier.count else {
            return nil
        }
        
        var accumulatedScore = 0
        suicidal = false
        
        var losingInterestCritical = false
        var feelingDepressedCritical = false
        var numberOfCriticalQuestions = 0
        
        for stepResult in stepResults {
            if let result = stepResult.firstResult as? ORKChoiceQuestionResult,
                value = result.choiceAnswers?.first as? NSNumber {

                    let score = value.integerValue
                    
                    if (score >= PHQ9ChoiceValue.MoreThanHalfTheDays.rawValue)
                        || (stepResult.identifier == QuestionIdentifier.FeelingSuicidal.rawValue
                            && score >= PHQ9ChoiceValue.SeveralDays.rawValue) {
                                numberOfCriticalQuestions++
                    }
                    
                    accumulatedScore += score
                    
                    switch stepResult.identifier {
                    case QuestionIdentifier.LosingInterest.rawValue:
                        losingInterestCritical = score >= PHQ9ChoiceValue.MoreThanHalfTheDays.rawValue
                    case QuestionIdentifier.FeelingDepressed.rawValue:
                        feelingDepressedCritical = score >= PHQ9ChoiceValue.MoreThanHalfTheDays.rawValue
                    case QuestionIdentifier.FeelingSuicidal.rawValue:
                        suicidal = score >= PHQ9ChoiceValue.SeveralDays.rawValue
                    default:
                        break
                    }
                    
            } else {
                return nil
            }
            
        }
        
        self.losingInterestCritical = losingInterestCritical
        self.feelingDepressedCritical = feelingDepressedCritical
        self.numberOfAnswersCritical = numberOfCriticalQuestions >= 4
        
        depressiveDisorderConsidered = (losingInterestCritical || feelingDepressedCritical) && (numberOfCriticalQuestions >= 4)
        
        score = accumulatedScore
        
        switch score {
        case 0:
            severity = .NoDepression
        case 1...4:
            severity = .MinimalDepression
        case 5...9:
            severity = .MildDepression
        case 10...14:
            severity = .ModerateDepression
        case 15...19:
            severity = .ModeratelySevereDepression
        case 20...27:
            severity = .SevereDepression
        default:
            severity = .NoDepression
        }
        
    }
    
}
