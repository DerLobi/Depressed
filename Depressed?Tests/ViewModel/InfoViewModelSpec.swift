import Depressed
import Foundation
import Nimble
import Quick

class InfoViewModelSpec: QuickSpec {
    
    override func spec() {

        var viewModel: InfoViewModel!
        
        beforeEach {
            viewModel = InfoViewModel()
        }
        
        describe("versionInformation") {
            
            it("returns the version and build number") {
                
                let infoDictionary = Bundle.main.infoDictionary!
                let version = infoDictionary["CFBundleShortVersionString"] as! String
                let build = infoDictionary["CFBundleVersion"] as! String

                expect(viewModel.versionInformation).to(equal("\(version) (\(build))"))
            }
        }
        
    }
}
