import Depressed
import Nimble
import Quick
import ResearchKit

class AnswerSpec: QuickSpec {
    
    override func spec() {
        
        describe("-init?(stepResult:)") {

            var answer: Answer?
            
            context("the identifier of the stepResult is not a valid QuestionIdentifier") {
                
                beforeEach {
                    let result = ORKChoiceQuestionResult()
                    result.choiceAnswers = [NSNumber(value: 2)]
                    let stepResult = ORKStepResult(stepIdentifier: "foo", results: [result])
                    answer = Answer(stepResult: stepResult)
                }
                
                it("fails") {
                    expect(answer).to(beNil())
                }
            }

            context("the stepResult has no firstResult") {
                
                beforeEach {
                    let stepResult = ORKStepResult(stepIdentifier: QuestionIdentifier.FeelingTired.rawValue, results: [])
                    answer = Answer(stepResult: stepResult)
                }
                
                it("fails") {
                    expect(answer).to(beNil())
                }
            }
            
            context("the first result of the stepResult has no choice answers") {
                
                beforeEach {
                    let result = ORKChoiceQuestionResult()
                    let stepResult = ORKStepResult(stepIdentifier: QuestionIdentifier.FeelingTired.rawValue, results: [result])
                    answer = Answer(stepResult: stepResult)
                }
                
                it("fails") {
                    expect(answer).to(beNil())
                }
            }

            context("the first result of the stepResult has a choice answers that is not a PHQ-9 choice") {
                
                beforeEach {
                    let result = ORKChoiceQuestionResult()
                    result.choiceAnswers = [NSNumber(value: 27)]
                    let stepResult = ORKStepResult(stepIdentifier: QuestionIdentifier.FeelingTired.rawValue, results: [result])
                    answer = Answer(stepResult: stepResult)
                }
                
                it("fails") {
                    expect(answer).to(beNil())
                }
            }
        }
        
        describe(".question") {

            var answer: Answer!
            
            beforeEach {
                let result = ORKChoiceQuestionResult()
                result.choiceAnswers = [NSNumber(value: 2)]
                let stepResult = ORKStepResult(stepIdentifier: QuestionIdentifier.FeelingTired.rawValue, results: [result])
                answer = Answer(stepResult: stepResult)
            }
            
            it("has the same identifier as that of the stepResult") {
                expect(answer.question.identifier).to(equal(QuestionIdentifier.FeelingTired))
            }
        }
        
        describe(".answerScore") {
            
            var answer: Answer!
            
            beforeEach {
                let result = ORKChoiceQuestionResult()
                result.choiceAnswers = [NSNumber(value: 2)]
                let stepResult = ORKStepResult(stepIdentifier: QuestionIdentifier.FeelingTired.rawValue, results: [result])
                answer = Answer(stepResult: stepResult)
            }
            
            it("is equal to the first choiceAnswer of the stepResult") {
                expect(answer.answerScore).to(equal(PHQ9ChoiceValue.moreThanHalfTheDays))
            }
            
        }
    }
}
