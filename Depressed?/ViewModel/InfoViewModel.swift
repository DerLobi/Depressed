import Foundation

public struct InfoViewModel {
    
    public let versionInformation: String = {
        
        if let version = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String,
            buildNumber = NSBundle.mainBundle().infoDictionary?["CFBundleVersion"] as? String {
            return "\(version) (\(buildNumber))"
        }
        
        return ""
    }()
    
    public init() {}
    
}