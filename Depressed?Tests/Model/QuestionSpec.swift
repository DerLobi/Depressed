import Depressed
import Nimble
import Quick
import ResearchKit

class QuestionSpec: QuickSpec {
    
    override func spec() {
        
        describe("-init(identifier:)") {
            
            sharedExamples("sets the correct identifier, title and text") { (context: SharedExampleContext) in

                let identifier = QuestionIdentifier(rawValue: context()["identifier"]! as! String)!
                let expectedTitle = context()["title"] as! String
                let expectedText = context()["text"] as! String
                
                let question = Question(identifier: identifier)
                
                it("sets the correct question identifier") {
                    expect(question.identifier).to(equal(identifier))
                }

                it("sets the correct title") {
                    expect(question.title).to(equal(expectedTitle))
                }

                it("sets the correct text") {
                    expect(question.text).to(equal(expectedText))
                }

            }
            
            itBehavesLike("sets the correct identifier, title and text") {
                return [
                    "identifier": QuestionIdentifier.losingInterest.rawValue,
                    "title": NSLocalizedString("question_title_losing_interest", comment: ""),
                    "text": NSLocalizedString("question_text_losing_interest", comment: "")
                ]
            }

            itBehavesLike("sets the correct identifier, title and text") {
                return [
                    "identifier": QuestionIdentifier.feelingDepressed.rawValue,
                    "title": NSLocalizedString("question_title_feeling_depressed", comment: ""),
                    "text": NSLocalizedString("question_text_feeling_depressed", comment: "")
                ]
            }

            itBehavesLike("sets the correct identifier, title and text") {
                return [
                    "identifier": QuestionIdentifier.troubleSleeping.rawValue,
                    "title": NSLocalizedString("question_title_trouble_sleeping", comment: ""),
                    "text": NSLocalizedString("question_text_trouble_sleeping", comment: "")
                ]
            }
            
            itBehavesLike("sets the correct identifier, title and text") {
                return [
                    "identifier": QuestionIdentifier.feelingTired.rawValue,
                    "title": NSLocalizedString("question_title_feeling_tired", comment: ""),
                    "text": NSLocalizedString("question_text_feeling_tired", comment: "")
                ]
            }

            itBehavesLike("sets the correct identifier, title and text") {
                return [
                    "identifier": QuestionIdentifier.poorAppetite.rawValue,
                    "title": NSLocalizedString("question_title_poor_appetite", comment: ""),
                    "text": NSLocalizedString("question_text_poor_appetite", comment: "")
                ]
            }

            itBehavesLike("sets the correct identifier, title and text") {
                return [
                    "identifier": QuestionIdentifier.lowSelfEsteem.rawValue,
                    "title": NSLocalizedString("question_title_low_self_esteem", comment: ""),
                    "text": NSLocalizedString("question_text_low_self_esteem", comment: "")
                ]
            }

            itBehavesLike("sets the correct identifier, title and text") {
                return [
                    "identifier": QuestionIdentifier.troubleConcentrating.rawValue,
                    "title": NSLocalizedString("question_title_trouble_concentrating", comment: ""),
                    "text": NSLocalizedString("question_text_trouble_concentrating", comment: "")
                ]
            }
        
            itBehavesLike("sets the correct identifier, title and text") {
                return [
                    "identifier": QuestionIdentifier.slowOrFast.rawValue,
                    "title": NSLocalizedString("question_title_slow_or_fast", comment: ""),
                    "text": NSLocalizedString("question_text_slow_or_fast", comment: "")
                ]
            }
            
            itBehavesLike("sets the correct identifier, title and text") {
                return [
                    "identifier": QuestionIdentifier.feelingSuicidal.rawValue,
                    "title": NSLocalizedString("question_title_feeling_suicidal", comment: ""),
                    "text": NSLocalizedString("question_text_feeling_suicidal", comment: "")
                ]
            }
        
        }
    }
}
