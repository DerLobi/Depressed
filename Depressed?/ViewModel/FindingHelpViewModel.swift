import Foundation

///  Viewmodel for displaying information of where a user can find help.
public struct FindingHelpViewModel {

    /// The URL of the help offer.
    public let url: NSURL

    /// A string describing the source of the help offer.
    public let credits: String

    ///  Creates a new `FindingHelpViewModel` for the given information
    ///
    ///  - parameter info: A `FindingHelpInformation`
    ///
    ///  - returns: A newly initialized `FindingHelpViewModel` instance
    public init(info: FindingHelpInformation) {
        url = info.url
        credits = String(format: NSLocalizedString("find_help_credits_format", comment: ""), info.organizationName)
    }
}
