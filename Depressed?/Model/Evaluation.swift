import ResearchKit

public enum Severity: String {
    case NoDepression
    case MinimalDepression
    case MildDepression
    case ModerateDepression
    case ModeratelySevereDepression
    case SevereDepression
}

public protocol EvaluationType {
    var depressiveDisorderConsidered: Bool { get }
    var score: Int { get }
    var severity: Severity { get }
    var suicidal: Bool { get }
}

public struct Evaluation: EvaluationType {
    
    public private(set) var depressiveDisorderConsidered: Bool
    
    public let score: Int
    
    public let severity: Severity
    
    public private(set) var suicidal: Bool
    
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
