import Foundation
import Depressed

internal struct MutableEvaluation: EvaluationType {
    
    internal var depressiveDisorderConsidered: Bool = false
    
    internal var score: Int = 0
    
    internal var severity: Severity = .NoDepression
    
    internal var suicidal: Bool = false
    
}