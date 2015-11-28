///  Identifier used to identify questions and the matching results.
public enum QuestionIdentifier: String {

    ///  Having little interest or pleasure.
    case LosingInterest
    
    ///  Feeling down, depressed, or hopeless.
    case FeelingDepressed
    
    ///  Trouble sleeping or sleeping too much.
    case TroubleSleeping
    
    ///  Feeling tired or having little energy.
    case FeelingTired
    
    ///  Poor appetite or overeating.
    case PoorAppetite
    
    ///  Feeling bad about yourself or like a failure.
    case LowSelfEsteem
    
    ///  Trouble concentrating on things.
    case TroubleConcentrating
    
    ///  Moving or speaking slowly or more than usual.
    case SlowOrFast
    
    ///  Thoughts to be better off dead or of hurting yourself.
    case FeelingSuicidal
    
    /// The total amount of question identifiers.
    public static let count: Int = [
        LosingInterest,
        FeelingDepressed,
        TroubleSleeping,
        FeelingTired,
        PoorAppetite,
        LowSelfEsteem,
        TroubleConcentrating,
        SlowOrFast,
        FeelingSuicidal
        ].count
}
