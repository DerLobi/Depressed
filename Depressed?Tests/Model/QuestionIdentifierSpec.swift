import Depressed
import Foundation
import Nimble
import Quick
import ResearchKit

class QuestionIdentifierSpec: QuickSpec {
    
    override func spec() {
        
        describe(".count") {
            
            it("is equal to 9") {
                expect(QuestionIdentifier.count).to(equal(9))
            }
            
        }
    }
}
 