import ResearchKit

///  Answer choice and the associated value.
///  The values are used to calculate the overall score.
public enum PHQ9ChoiceValue: Int {

    ///  Not at all.
    case notAtAll = 0

    ///  Several days.
    case severalDays = 1

    ///  More than half the days.
    case moreThanHalfTheDays = 2

    ///  Nearly every day.
    case nearlyEveryDay = 3
}

extension PHQ9ChoiceValue: Comparable { }

///  Compares two PHQ-9 choice values.
///
///  - parameter lhs: A choice value.
///  - parameter rhs: A choice value.
///
///  - returns: `true` if the value of the left choice is lower than the right.
public func < (lhs: PHQ9ChoiceValue, rhs: PHQ9ChoiceValue) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

extension ORKTextChoice {

    /// Choices the user can choose from, expressing the frequency.
    @nonobjc
    static let phq9Choices: [ORKTextChoice] = [
        ORKTextChoice(text: NSLocalizedString("choice_not_at_all", comment: ""), value: PHQ9ChoiceValue.notAtAll.rawValue as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: NSLocalizedString("choice_several_days", comment: ""), value: PHQ9ChoiceValue.severalDays.rawValue as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: NSLocalizedString("choice_more_than_half_the_days", comment: ""), value: PHQ9ChoiceValue.moreThanHalfTheDays.rawValue as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: NSLocalizedString("choice_nearly_every_day", comment: ""), value: PHQ9ChoiceValue.nearlyEveryDay.rawValue as NSCoding & NSCopying & NSObjectProtocol)
    ]
}
