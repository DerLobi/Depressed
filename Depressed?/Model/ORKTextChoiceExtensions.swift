import ResearchKit

///  Answer choice and the associated value.
///  The values are used to calculate the overall score.
public enum PHQ9ChoiceValue: Int {

    ///  Not at all.
    case NotAtAll = 0

    ///  Several days.
    case SeveralDays = 1

    ///  More than half the days.
    case MoreThanHalfTheDays = 2

    ///  Nearly every day.
    case NearlyEveryDay = 3
}

extension PHQ9ChoiceValue: Comparable { }

///  Compares two PHQ-9 choice values.
///
///  - parameter lhs: A choice value.
///  - parameter rhs: A choice value.
///
///  - returns: `true` if the value of the left choice is lower than the right.
public func <(lhs: PHQ9ChoiceValue, rhs: PHQ9ChoiceValue) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

extension ORKTextChoice {

    /// Choices the user can choose from, expressing the frequency.
    @nonobjc
    static let phq9Choices: [ORKTextChoice] = [
        ORKTextChoice(text: NSLocalizedString("choice_not_at_all", comment: ""), value: PHQ9ChoiceValue.NotAtAll.rawValue),
        ORKTextChoice(text: NSLocalizedString("choice_several_days", comment: ""), value: PHQ9ChoiceValue.SeveralDays.rawValue),
        ORKTextChoice(text: NSLocalizedString("choice_more_than_half_the_days", comment: ""), value: PHQ9ChoiceValue.MoreThanHalfTheDays.rawValue),
        ORKTextChoice(text: NSLocalizedString("choice_nearly_every_day", comment: ""), value: PHQ9ChoiceValue.NearlyEveryDay.rawValue)
    ]
}
