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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .nearlyEveryDay),
                        makeStepResult(.FeelingTired, value: .nearlyEveryDay),
                        makeStepResult(.PoorAppetite, value: .nearlyEveryDay),
                        makeStepResult(.LowSelfEsteem, value: .nearlyEveryDay),
                        makeStepResult(.TroubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .nearlyEveryDay),
                        makeStepResult(.FeelingSuicidal, value: .nearlyEveryDay)
                    ],
                    "considered": false
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .nearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "considered": false
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "considered": true
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .moreThanHalfTheDays),
                        makeStepResult(.SlowOrFast, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "considered": true
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "considered": true
                ]
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .moreThanHalfTheDays),
                        makeStepResult(.SlowOrFast, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "considered": true
                ]
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .severalDays)
                    ],
                    "considered": true
                ]
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .severalDays)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .severalDays)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .moreThanHalfTheDays)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .nearlyEveryDay)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .severalDays),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .nearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .severalDays),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .nearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .nearlyEveryDay),
                        makeStepResult(.FeelingTired, value: .nearlyEveryDay),
                        makeStepResult(.PoorAppetite, value: .nearlyEveryDay),
                        makeStepResult(.LowSelfEsteem, value: .nearlyEveryDay),
                        makeStepResult(.TroubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .nearlyEveryDay),
                        makeStepResult(.FeelingSuicidal, value: .nearlyEveryDay)
                    ],
                    "critical": true
                ]
            }
            
            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "critical": true
                ]
            }
        
            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .moreThanHalfTheDays),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "critical": true
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .moreThanHalfTheDays),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "critical": true
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .moreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .moreThanHalfTheDays),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .moreThanHalfTheDays)
                    ],
                    "critical": true
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .nearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .nearlyEveryDay)
                    ],
                    "critical": false
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "critical": false
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .severalDays),
                        makeStepResult(.FeelingDepressed, value: .severalDays),
                        makeStepResult(.TroubleSleeping, value: .severalDays),
                        makeStepResult(.FeelingTired, value: .severalDays),
                        makeStepResult(.PoorAppetite, value: .severalDays),
                        makeStepResult(.LowSelfEsteem, value: .severalDays),
                        makeStepResult(.TroubleConcentrating, value: .severalDays),
                        makeStepResult(.SlowOrFast, value: .severalDays),
                        makeStepResult(.FeelingSuicidal, value: .severalDays)
                    ],
                    "critical": false
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .nearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .severalDays),
                        makeStepResult(.FeelingTired, value: .severalDays),
                        makeStepResult(.PoorAppetite, value: .severalDays),
                        makeStepResult(.LowSelfEsteem, value: .severalDays),
                        makeStepResult(.TroubleConcentrating, value: .severalDays),
                        makeStepResult(.SlowOrFast, value: .severalDays),
                        makeStepResult(.FeelingSuicidal, value: .nearlyEveryDay)
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
                        makeStepResult(.LosingInterest, value: .nearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .nearlyEveryDay),
                        makeStepResult(.FeelingTired, value: .nearlyEveryDay),
                        makeStepResult(.PoorAppetite, value: .nearlyEveryDay),
                        makeStepResult(.LowSelfEsteem, value: .nearlyEveryDay),
                        makeStepResult(.TroubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .nearlyEveryDay),
                        makeStepResult(.FeelingSuicidal, value: .nearlyEveryDay)
                    ],
                    "score": 27
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "score": 0
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .severalDays),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "score": 1
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .severalDays),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .severalDays),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "score": 2
                ]
            }
            
            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .nearlyEveryDay),
                        makeStepResult(.LowSelfEsteem, value: .severalDays),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .severalDays),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "score": 8
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .nearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .severalDays),
                        makeStepResult(.FeelingTired, value: .severalDays),
                        makeStepResult(.PoorAppetite, value: .nearlyEveryDay),
                        makeStepResult(.LowSelfEsteem, value: .severalDays),
                        makeStepResult(.TroubleConcentrating, value: .severalDays),
                        makeStepResult(.SlowOrFast, value: .severalDays),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
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
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .notAtAll),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "severity": Severity.NoDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .severalDays),
                        makeStepResult(.TroubleSleeping, value: .notAtAll),
                        makeStepResult(.FeelingTired, value: .notAtAll),
                        makeStepResult(.PoorAppetite, value: .notAtAll),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "severity": Severity.MinimalDepression.rawValue
                ]
            }
            
            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .severalDays),
                        makeStepResult(.FeelingTired, value: .severalDays),
                        makeStepResult(.PoorAppetite, value: .severalDays),
                        makeStepResult(.LowSelfEsteem, value: .notAtAll),
                        makeStepResult(.TroubleConcentrating, value: .notAtAll),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "severity": Severity.MildDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .notAtAll),
                        makeStepResult(.FeelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .severalDays),
                        makeStepResult(.FeelingTired, value: .severalDays),
                        makeStepResult(.PoorAppetite, value: .severalDays),
                        makeStepResult(.LowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .notAtAll),
                        makeStepResult(.FeelingSuicidal, value: .notAtAll)
                    ],
                    "severity": Severity.ModerateDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .severalDays),
                        makeStepResult(.FeelingTired, value: .severalDays),
                        makeStepResult(.PoorAppetite, value: .severalDays),
                        makeStepResult(.LowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .severalDays),
                        makeStepResult(.FeelingSuicidal, value: .moreThanHalfTheDays)
                    ],
                    "severity": Severity.ModeratelySevereDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .moreThanHalfTheDays),
                        makeStepResult(.FeelingTired, value: .nearlyEveryDay),
                        makeStepResult(.PoorAppetite, value: .moreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .moreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .severalDays),
                        makeStepResult(.FeelingSuicidal, value: .moreThanHalfTheDays)
                    ],
                    "severity": Severity.SevereDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .nearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .nearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .nearlyEveryDay),
                        makeStepResult(.FeelingTired, value: .nearlyEveryDay),
                        makeStepResult(.PoorAppetite, value: .nearlyEveryDay),
                        makeStepResult(.LowSelfEsteem, value: .nearlyEveryDay),
                        makeStepResult(.TroubleConcentrating, value: .nearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .nearlyEveryDay),
                        makeStepResult(.FeelingSuicidal, value: .nearlyEveryDay)
                    ],
                    "severity": Severity.SevereDepression.rawValue
                ]
            }

        }
        
        describe(".answers") {
        
            var evaluation: Evaluation!
            
            beforeEach {
                let stepResults = [
                    makeStepResult(.LosingInterest, value: .nearlyEveryDay),
                    makeStepResult(.FeelingDepressed, value: .severalDays),
                    makeStepResult(.TroubleSleeping, value: .nearlyEveryDay),
                    makeStepResult(.FeelingTired, value: .severalDays),
                    makeStepResult(.PoorAppetite, value: .notAtAll),
                    makeStepResult(.LowSelfEsteem, value: .nearlyEveryDay),
                    makeStepResult(.TroubleConcentrating, value: .severalDays),
                    makeStepResult(.SlowOrFast, value: .moreThanHalfTheDays),
                    makeStepResult(.FeelingSuicidal, value: .notAtAll)
                ]
                
                evaluation = Evaluation(stepResults: stepResults)
            }
            
            it("contains nine answers") {
                expect(evaluation.answers).to(haveCount(9))
            }
        
            it("has questions with the correct identifiers") {
                let identifiers: [QuestionIdentifier] = [
                    .LosingInterest,
                    .FeelingDepressed,
                    .TroubleSleeping,
                    .FeelingTired,
                    .PoorAppetite,
                    .LowSelfEsteem,
                    .TroubleConcentrating,
                    .SlowOrFast,
                    .FeelingSuicidal
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
