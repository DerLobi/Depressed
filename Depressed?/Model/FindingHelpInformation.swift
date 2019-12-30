import Foundation

///  Information about where the user can get help, based on their locale.
public struct FindingHelpInformation {

    /// A URL where the user can find help.
    public let url: URL

    /// The name of the organization that we link to.
    public let organizationName: String

    init(url: URL, organizationName: String) {
        self.url = url
        self.organizationName = organizationName
    }

    ///  Creates a new `FindingHelpInformation` if information is available
    ///  for the given locale.
    ///
    ///  - parameter locale: The locale for which the information is suitable.
    ///
    ///  - returns: A newly initialized `FindingHelpInformation` or `nil`.
    public init?(locale: Locale) {

        guard let language = (locale as NSLocale).object(forKey: NSLocale.Key.languageCode) as? String,
            let country = (locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as? String else { return nil }

        switch (language, country) {
        case (_, "US"):
            url = URL(string: "http://www.adaa.org/finding-help")!
            organizationName = "Anxiety and Depression Association of America (ADAA) / www.adaa.org"
        case (_, "DE"):
            url = URL(string: "http://www.deutsche-depressionshilfe.de/stiftung/erste-hilfe.php")!
            organizationName = "Stiftung Deutsche Depressionshilfe"
        default:
            return nil
        }
    }

}
