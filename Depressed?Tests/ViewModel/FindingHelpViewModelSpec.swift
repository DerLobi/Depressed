import Depressed
import Foundation
import Nimble
import Quick
import ResearchKit

class FindingHelpViewModelSpec: QuickSpec {
    
    override func spec() {
        
        var viewModel: FindingHelpViewModel!
        
        let infoModel = FindingHelpInformation(url: NSURL(string: "http://example.com")!, organizationName: "Example Alliance Against Depression")

        beforeEach {
            viewModel = FindingHelpViewModel(info: infoModel)
        }
        
        describe(".url") {
            
            it("is the URL of the model") {
                expect(viewModel.url).to(equal(infoModel.url))
            }
        }

        describe(".credits") {
            
            it("is the localized string 'find_help_credits_format' and the organization name") {
                let expectedString = String(format: NSLocalizedString("find_help_credits_format", comment: ""), infoModel.organizationName)
                expect(viewModel.credits).to(equal(expectedString))
            }
        }
    }
}
