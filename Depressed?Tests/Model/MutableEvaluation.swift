import Foundation
import Depressed

///  Struct with mutable properties implementing `EvaluationType` for use in tests.
internal struct MutableEvaluation: EvaluationType {
    
    internal var depressiveDisorderConsidered: Bool = false
    
    internal var score: Int = 0
    
    internal var severity: Severity = .NoDepression
    
    internal var suicidal: Bool = false
    
    internal var losingInterestCritical: Bool = false
    
    internal var feelingDepressedCritical: Bool = false
    
    internal var numberOfAnswersCritical: Bool = false
    
}
