import Depressed
import Foundation
import Nimble
import Quick
import ResearchKit

class EvaluationSpec: QuickSpec {

    override func spec() {
     
        describe("-init?(stepResults:)") {

            var evaluation: Evaluation?
            
            context("there are less than 9 step results") {

                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("fails") {
                    expect(evaluation).to(beNil())
                }
                
            }

            context("there are more than 9 step results") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("fails") {
                    expect(evaluation).to(beNil())
                }
                
            }

            context("there are exactly 9 step results") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("fails") {
                    expect(evaluation).toNot(beNil())
                }
                
            }

        }
        
        describe(".depressiveDisorderConsidered") {

            sharedExamples("returns the correct decision") { (context: SharedExampleContext) in
                let results = context()["results"] as! [ORKStepResult]
                let shouldBeConsidered = context()["considered"] as! Bool
                
                let evaluation = Evaluation(stepResults: results)
                
                it("decides correctly") {
                    expect(evaluation?.depressiveDisorderConsidered).to(equal(shouldBeConsidered))
                }
                
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .nearlyEveryDay),
                        makeStepResult(.feelingTired, value: .nearlyEveryDay),
                        makeStepResult(.poorAppetite, value: .nearlyEveryDay),
                        makeStepResult(.lowSelfEsteem, value: .nearlyEveryDay),
                        makeStepResult(.troubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.slowOrFast, value: .nearlyEveryDay),
                        makeStepResult(.feelingSuicidal, value: .nearlyEveryDay)
                    ],
                    "considered": false
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .nearlyEveryDay),
                        makeStepResult(.feelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "considered": false
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.poorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.lowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "considered": true
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.lowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleConcentrating, value: .moreThanHalfTheDays),
                        makeStepResult(.slowOrFast, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "considered": true
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleSleeping, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.poorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.lowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "considered": true
                ]
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.lowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleConcentrating, value: .moreThanHalfTheDays),
                        makeStepResult(.slowOrFast, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "considered": true
                ]
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.poorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.lowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .severalDays)
                    ],
                    "considered": true
                ]
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.poorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.lowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .severalDays)
                    ],
                    "considered": true
                ]
            }
        }
        
        describe(".suicidal") {
            
            var evaluation: Evaluation!
            
            context("the question about suicide is answered with 'not at all'") {

                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("is false") {
                    expect(evaluation.suicidal).to(beFalse())
                }
                
            }
            
            context("the question about suicide is answered with 'several days'") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .severalDays)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("is true") {
                    expect(evaluation.suicidal).to(beTrue())
                }
                
            }

            context("the question about suicide is answered with 'more than half the days'") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .moreThanHalfTheDays)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("is true") {
                    expect(evaluation.suicidal).to(beTrue())
                }
                
            }

            context("the question about suicide is answered with 'nearly every day'") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .nearlyEveryDay)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("is true") {
                    expect(evaluation.suicidal).to(beTrue())
                }
                
            }
        
        }
        
        describe(".losingInterestCritical") {
            
            var evaluation: Evaluation!
            
            context("the question about losing interest is answered with 'not at all'") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("is false") {
                    expect(evaluation.losingInterestCritical).to(beFalse())
                }
                
            }
            
            context("the question about losing interest is answered with 'several days'") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .severalDays),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("is false") {
                    expect(evaluation.losingInterestCritical).to(beFalse())
                }
                
            }
            
            context("the question about losing interest is answered with 'more than half the days'") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("is true") {
                    expect(evaluation.losingInterestCritical).to(beTrue())
                }
                
            }
            
            context("the question about losing interest is answered with 'nearly every day'") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .nearlyEveryDay),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("is true") {
                    expect(evaluation.losingInterestCritical).to(beTrue())
                }
                
            }
            
        }
        
        describe(".feelingDepressedCritical") {
            
            var evaluation: Evaluation!
            
            context("the question about feeling depressed is answered with 'not at all'") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("is false") {
                    expect(evaluation.feelingDepressedCritical).to(beFalse())
                }
                
            }
            
            context("the question about feeling depressed is answered with 'several days'") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .severalDays),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("is false") {
                    expect(evaluation.feelingDepressedCritical).to(beFalse())
                }
                
            }
            
            context("the question about feeling depressed is answered with 'more than half the days'") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("is true") {
                    expect(evaluation.feelingDepressedCritical).to(beTrue())
                }
                
            }
            
            context("the question about feeling depressed is answered with 'nearly every day'") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("is true") {
                    expect(evaluation.feelingDepressedCritical).to(beTrue())
                }
                
            }
            
        }

        describe(".numberOfAnswersCritical") {
            
            sharedExamples("returns whether four or more questions are answered critically") { (context: SharedExampleContext) in
                let results = context()["results"] as! [ORKStepResult]
                let critical = context()["critical"] as! Bool
                
                let evaluation = Evaluation(stepResults: results)
                
                it("returns the correct value") {
                    expect(evaluation?.numberOfAnswersCritical).to(equal(critical))
                }
            }
            
            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .nearlyEveryDay),
                        makeStepResult(.feelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.troubleSleeping, value: .nearlyEveryDay),
                        makeStepResult(.feelingTired, value: .nearlyEveryDay),
                        makeStepResult(.poorAppetite, value: .nearlyEveryDay),
                        makeStepResult(.lowSelfEsteem, value: .nearlyEveryDay),
                        makeStepResult(.troubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.slowOrFast, value: .nearlyEveryDay),
                        makeStepResult(.feelingSuicidal, value: .nearlyEveryDay)
                    ],
                    "critical": true
                ]
            }
            
            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleSleeping, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "critical": true
                ]
            }
        
            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleConcentrating, value: .moreThanHalfTheDays),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "critical": true
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleConcentrating, value: .moreThanHalfTheDays),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "critical": true
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.poorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.lowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleConcentrating, value: .moreThanHalfTheDays),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .moreThanHalfTheDays)
                    ],
                    "critical": true
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .nearlyEveryDay),
                        makeStepResult(.feelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .nearlyEveryDay)
                    ],
                    "critical": false
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "critical": false
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .severalDays),
                        makeStepResult(.feelingDepressed, value: .severalDays),
                        makeStepResult(.troubleSleeping, value: .severalDays),
                        makeStepResult(.feelingTired, value: .severalDays),
                        makeStepResult(.poorAppetite, value: .severalDays),
                        makeStepResult(.lowSelfEsteem, value: .severalDays),
                        makeStepResult(.troubleConcentrating, value: .severalDays),
                        makeStepResult(.slowOrFast, value: .severalDays),
                        makeStepResult(.feelingSuicidal, value: .severalDays)
                    ],
                    "critical": false
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .nearlyEveryDay),
                        makeStepResult(.feelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.troubleSleeping, value: .severalDays),
                        makeStepResult(.feelingTired, value: .severalDays),
                        makeStepResult(.poorAppetite, value: .severalDays),
                        makeStepResult(.lowSelfEsteem, value: .severalDays),
                        makeStepResult(.troubleConcentrating, value: .severalDays),
                        makeStepResult(.slowOrFast, value: .severalDays),
                        makeStepResult(.feelingSuicidal, value: .nearlyEveryDay)
                    ],
                    "critical": false
                ]
            }

        }
        
        describe(".score") {
        
            sharedExamples("calculates the correct score") { (context: SharedExampleContext) in
                let results = context()["results"] as! [ORKStepResult]
                let expectedScore = context()["score"] as! Int
                
                let evaluation = Evaluation(stepResults: results)
                
                it("sums up correctly") {
                    expect(evaluation?.score).to(equal(expectedScore))
                }
                
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .nearlyEveryDay),
                        makeStepResult(.feelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.troubleSleeping, value: .nearlyEveryDay),
                        makeStepResult(.feelingTired, value: .nearlyEveryDay),
                        makeStepResult(.poorAppetite, value: .nearlyEveryDay),
                        makeStepResult(.lowSelfEsteem, value: .nearlyEveryDay),
                        makeStepResult(.troubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.slowOrFast, value: .nearlyEveryDay),
                        makeStepResult(.feelingSuicidal, value: .nearlyEveryDay)
                    ],
                    "score": 27
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "score": 0
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .severalDays),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "score": 1
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .severalDays),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .severalDays),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "score": 2
                ]
            }
            
            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .nearlyEveryDay),
                        makeStepResult(.lowSelfEsteem, value: .severalDays),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .severalDays),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "score": 8
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .nearlyEveryDay),
                        makeStepResult(.feelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.troubleSleeping, value: .severalDays),
                        makeStepResult(.feelingTired, value: .severalDays),
                        makeStepResult(.poorAppetite, value: .nearlyEveryDay),
                        makeStepResult(.lowSelfEsteem, value: .severalDays),
                        makeStepResult(.troubleConcentrating, value: .severalDays),
                        makeStepResult(.slowOrFast, value: .severalDays),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "score": 14
                ]
            }

        }
        
        describe(".severity") {
            
            sharedExamples("returns the correct severity") { (context: SharedExampleContext) in
                let results = context()["results"] as! [ORKStepResult]
                let expectedSeverityRaw = context()["severity"] as! Severity.RawValue
                let expectedSeverity = Severity(rawValue: expectedSeverityRaw)
                
                let evaluation = Evaluation(stepResults: results)
                
                it("chooses correctly") {
                    expect(evaluation?.severity).to(equal(expectedSeverity))
                }
                
            }
            
            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .notAtAll),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "severity": Severity.noDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .severalDays),
                        makeStepResult(.troubleSleeping, value: .notAtAll),
                        makeStepResult(.feelingTired, value: .notAtAll),
                        makeStepResult(.poorAppetite, value: .notAtAll),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "severity": Severity.minimalDepression.rawValue
                ]
            }
            
            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleSleeping, value: .severalDays),
                        makeStepResult(.feelingTired, value: .severalDays),
                        makeStepResult(.poorAppetite, value: .severalDays),
                        makeStepResult(.lowSelfEsteem, value: .notAtAll),
                        makeStepResult(.troubleConcentrating, value: .notAtAll),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "severity": Severity.mildDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .notAtAll),
                        makeStepResult(.feelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleSleeping, value: .severalDays),
                        makeStepResult(.feelingTired, value: .severalDays),
                        makeStepResult(.poorAppetite, value: .severalDays),
                        makeStepResult(.lowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.slowOrFast, value: .notAtAll),
                        makeStepResult(.feelingSuicidal, value: .notAtAll)
                    ],
                    "severity": Severity.moderateDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleSleeping, value: .severalDays),
                        makeStepResult(.feelingTired, value: .severalDays),
                        makeStepResult(.poorAppetite, value: .severalDays),
                        makeStepResult(.lowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.slowOrFast, value: .severalDays),
                        makeStepResult(.feelingSuicidal, value: .moreThanHalfTheDays)
                    ],
                    "severity": Severity.moderatelySevereDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.troubleSleeping, value: .moreThanHalfTheDays),
                        makeStepResult(.feelingTired, value: .nearlyEveryDay),
                        makeStepResult(.poorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.lowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.troubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.slowOrFast, value: .severalDays),
                        makeStepResult(.feelingSuicidal, value: .moreThanHalfTheDays)
                    ],
                    "severity": Severity.severeDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.losingInterest, value: .nearlyEveryDay),
                        makeStepResult(.feelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.troubleSleeping, value: .nearlyEveryDay),
                        makeStepResult(.feelingTired, value: .nearlyEveryDay),
                        makeStepResult(.poorAppetite, value: .nearlyEveryDay),
                        makeStepResult(.lowSelfEsteem, value: .nearlyEveryDay),
                        makeStepResult(.troubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.slowOrFast, value: .nearlyEveryDay),
                        makeStepResult(.feelingSuicidal, value: .nearlyEveryDay)
                    ],
                    "severity": Severity.severeDepression.rawValue
                ]
            }

        }
        
        describe(".answers") {
        
            var evaluation: Evaluation!
            
            beforeEach {
                let stepResults = [
                    makeStepResult(.losingInterest, value: .nearlyEveryDay),
                    makeStepResult(.feelingDepressed, value: .severalDays),
                    makeStepResult(.troubleSleeping, value: .nearlyEveryDay),
                    makeStepResult(.feelingTired, value: .severalDays),
                    makeStepResult(.poorAppetite, value: .notAtAll),
                    makeStepResult(.lowSelfEsteem, value: .nearlyEveryDay),
                    makeStepResult(.troubleConcentrating, value: .severalDays),
                    makeStepResult(.slowOrFast, value: .moreThanHalfTheDays),
                    makeStepResult(.feelingSuicidal, value: .notAtAll)
                ]
                
                evaluation = Evaluation(stepResults: stepResults)
            }
            
            it("contains nine answers") {
                expect(evaluation.answers).to(haveCount(9))
            }
        
            it("has questions with the correct identifiers") {
                let identifiers: [QuestionIdentifier] = [
                    .losingInterest,
                    .feelingDepressed,
                    .troubleSleeping,
                    .feelingTired,
                    .poorAppetite,
                    .lowSelfEsteem,
                    .troubleConcentrating,
                    .slowOrFast,
                    .feelingSuicidal
                ]
                
                for (idx, answer) in evaluation.answers.enumerated() {
                    expect(answer.question.identifier).to(equal(identifiers[idx]))
                }
            }

            it("has questions with the correct answer scores") {
                let values: [PHQ9ChoiceValue] = [
                    .nearlyEveryDay,
                    .severalDays,
                    .nearlyEveryDay,
                    .severalDays,
                    .notAtAll,
                    .nearlyEveryDay,
                    .severalDays,
                    .moreThanHalfTheDays,
                    .notAtAll
                ]
                
                for (idx, answer) in evaluation.answers.enumerated() {
                    expect(answer.answerScore).to(equal(values[idx]))
                }
                
            }

        }
    }
    
}

//MARK: Helpers

internal func makeStepResult(_ identifier: QuestionIdentifier, value: PHQ9ChoiceValue) -> ORKStepResult {
    let result = ORKStepResult()
    result.identifier = identifier.rawValue
    result.results = [choiceResult(value)]
    
    return result
}

private func choiceResult(_ value: PHQ9ChoiceValue) -> ORKChoiceQuestionResult {
    let result = ORKChoiceQuestionResult()
    
    result.choiceAnswers = [value.rawValue]
    
    return result
}
