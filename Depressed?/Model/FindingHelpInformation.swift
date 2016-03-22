import Foundation

///  Information about where the user can get help, based on their locale.
public struct FindingHelpInformation {

    /// A URL where the user can find help.
    public let url: NSURL

    /// The name of the organization that we link to.
    public let organizationName: String

    ///  Creates a new `FindingHelpInformation` if information is available
    ///  for the given locale.
    ///
    ///  - parameter locale: The locale for which the information is suitable.
    ///
    ///  - returns: A newly initialized `FindingHelpInformation` or `nil`.
    public init?(locale: NSLocale) {

        guard let language = locale.objectForKey(NSLocaleLanguageCode) as? String,
            country = locale.objectForKey(NSLocaleCountryCode) as? String else { return nil }

        switch (language, country) {
        case (_, "US"):
            url = NSURL(string: "http://www.adaa.org/finding-help")!
            organizationName = "Anxiety and Depression Association of America (ADAA) / www.adaa.org"
        case (_, "DE"):
            url = NSURL(string: "http://www.deutsche-depressionshilfe.de/stiftung/erste-hilfe.php")!
            organizationName = "Stiftung Deutsche Depressionshilfe"
        default:
            return nil
        }
    }

}
