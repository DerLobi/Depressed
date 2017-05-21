///  Identifier used to identify questions and the matching results.
public enum QuestionIdentifier: String {

    ///  Having little interest or pleasure.
    case losingInterest

    ///  Feeling down, depressed, or hopeless.
    case feelingDepressed

    ///  Trouble sleeping or sleeping too much.
    case troubleSleeping

    ///  Feeling tired or having little energy.
    case feelingTired

    ///  Poor appetite or overeating.
    case poorAppetite

    ///  Feeling bad about yourself or like a failure.
    case lowSelfEsteem

    ///  Trouble concentrating on things.
    case troubleConcentrating

    ///  Moving or speaking slowly or more than usual.
    case slowOrFast

    ///  Thoughts to be better off dead or of hurting yourself.
    case feelingSuicidal

    /// The total amount of question identifiers.
    public static let count: Int = [
        losingInterest,
        feelingDepressed,
        troubleSleeping,
        feelingTired,
        poorAppetite,
        lowSelfEsteem,
        troubleConcentrating,
        slowOrFast,
        feelingSuicidal
        ].count
}
