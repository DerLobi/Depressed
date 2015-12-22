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

    /// The answers a user has given to all questions.
    var answers: [Answer] { get }
}

///  Evaluation that presents the results based on `ORKStepResult`s.
public struct Evaluation: EvaluationType {
    
    /// Whether a depressive disorder should be considered.
    public var depressiveDisorderConsidered: Bool {
        return (losingInterestCritical || feelingDepressedCritical) && numberOfAnswersCritical
    }
    
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
    public let numberOfAnswersCritical: Bool
    
    /// The answers a user has given to all questions.
    public let answers: [Answer]

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
        
        suicidal = false
        
        losingInterestCritical = false
        feelingDepressedCritical = false
        var numberOfCriticalQuestions = 0
        
        answers = stepResults.map { Answer(stepResult: $0) }
            .filter { $0 != nil }
            .map { $0! }
                
            
        for answer in answers where (answer.question.identifier == .FeelingSuicidal
            && answer.answerScore >= .SeveralDays)
            || answer.answerScore >= .MoreThanHalfTheDays {
                
                numberOfCriticalQuestions++
                
                switch answer.question.identifier {
                case .LosingInterest:
                    losingInterestCritical = true
                case .FeelingDepressed:
                    feelingDepressedCritical = true
                case .FeelingSuicidal:
                    suicidal = true
                default:
                    break
                }
        }
        
        score = answers.reduce(0) { sum, answer in
            return sum + answer.answerScore.rawValue
        }
        
        self.numberOfAnswersCritical = numberOfCriticalQuestions >= 4
        
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
