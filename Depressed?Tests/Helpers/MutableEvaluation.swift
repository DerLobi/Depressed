import Foundation
import Depressed

///  Struct with mutable properties implementing `EvaluationType` for use in tests.
struct MutableEvaluation: EvaluationType {
    
    var depressiveDisorderConsidered: Bool = false
    
    var score: Int = 0
    
    var severity: Severity = .noDepression
    
    var suicidal: Bool = false
    
    var losingInterestCritical: Bool = false
    
    var feelingDepressedCritical: Bool = false
    
    var numberOfAnswersCritical: Bool = false
    
    var answers: [Answer] = []
}
