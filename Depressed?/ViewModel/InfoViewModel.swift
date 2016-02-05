import Foundation

///  Viewmodel for displaying 'About' information.
public struct InfoViewModel {
    
    /// The current version and build number as a user-presentable string.
    public let versionInformation: String = {
        
        if let version = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String,
            buildNumber = NSBundle.mainBundle().infoDictionary?["CFBundleVersion"] as? String {
            return "\(version) (\(buildNumber))"
        }
        
        return ""
    }()
    
    public init() {}
    
}
