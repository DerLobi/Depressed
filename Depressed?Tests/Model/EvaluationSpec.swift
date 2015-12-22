import Depressed
import Foundation
import Nimble
import Quick
import ResearchKit

class EvaluationSpec: QuickSpec {

    override func spec() {
     
        describe("-init?(stepResults:)") {

            var evaluation: Evaluation?
            
            context("there are less that 9 step results") {

                beforeEach {
                    let stepResults = [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("fails") {
                    expect(evaluation).to(beNil())
                }
                
            }

            context("there are less more than 9 step results") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll)
                    ]
                    evaluation = Evaluation(stepResults: stepResults)
                }
                
                it("fails") {
                    expect(evaluation).to(beNil())
                }
                
            }

            context("there are less exactly 9 step results") {
                
                beforeEach {
                    let stepResults = [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NearlyEveryDay),
                        makeStepResult(.FeelingTired, value: .NearlyEveryDay),
                        makeStepResult(.PoorAppetite, value: .NearlyEveryDay),
                        makeStepResult(.LowSelfEsteem, value: .NearlyEveryDay),
                        makeStepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .NearlyEveryDay),
                        makeStepResult(.FeelingSuicidal, value: .NearlyEveryDay)
                    ],
                    "considered": false
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "considered": false
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "considered": true
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .MoreThanHalfTheDays),
                        makeStepResult(.SlowOrFast, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "considered": true
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "considered": true
                ]
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .MoreThanHalfTheDays),
                        makeStepResult(.SlowOrFast, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "considered": true
                ]
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .SeveralDays)
                    ],
                    "considered": true
                ]
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .SeveralDays)
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
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .SeveralDays)
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
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .MoreThanHalfTheDays)
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
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NearlyEveryDay)
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
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        makeStepResult(.LosingInterest, value: .SeveralDays),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        makeStepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        makeStepResult(.LosingInterest, value: .NearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .SeveralDays),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        makeStepResult(.LosingInterest, value: .NearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .NearlyEveryDay),
                        makeStepResult(.FeelingTired, value: .NearlyEveryDay),
                        makeStepResult(.PoorAppetite, value: .NearlyEveryDay),
                        makeStepResult(.LowSelfEsteem, value: .NearlyEveryDay),
                        makeStepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .NearlyEveryDay),
                        makeStepResult(.FeelingSuicidal, value: .NearlyEveryDay)
                    ],
                    "critical": true
                ]
            }
            
            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "critical": true
                ]
            }
        
            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .MoreThanHalfTheDays),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "critical": true
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .MoreThanHalfTheDays),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "critical": true
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        makeStepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .MoreThanHalfTheDays),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .MoreThanHalfTheDays)
                    ],
                    "critical": true
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NearlyEveryDay)
                    ],
                    "critical": false
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "critical": false
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .SeveralDays),
                        makeStepResult(.FeelingDepressed, value: .SeveralDays),
                        makeStepResult(.TroubleSleeping, value: .SeveralDays),
                        makeStepResult(.FeelingTired, value: .SeveralDays),
                        makeStepResult(.PoorAppetite, value: .SeveralDays),
                        makeStepResult(.LowSelfEsteem, value: .SeveralDays),
                        makeStepResult(.TroubleConcentrating, value: .SeveralDays),
                        makeStepResult(.SlowOrFast, value: .SeveralDays),
                        makeStepResult(.FeelingSuicidal, value: .SeveralDays)
                    ],
                    "critical": false
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .SeveralDays),
                        makeStepResult(.FeelingTired, value: .SeveralDays),
                        makeStepResult(.PoorAppetite, value: .SeveralDays),
                        makeStepResult(.LowSelfEsteem, value: .SeveralDays),
                        makeStepResult(.TroubleConcentrating, value: .SeveralDays),
                        makeStepResult(.SlowOrFast, value: .SeveralDays),
                        makeStepResult(.FeelingSuicidal, value: .NearlyEveryDay)
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
                        makeStepResult(.LosingInterest, value: .NearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .NearlyEveryDay),
                        makeStepResult(.FeelingTired, value: .NearlyEveryDay),
                        makeStepResult(.PoorAppetite, value: .NearlyEveryDay),
                        makeStepResult(.LowSelfEsteem, value: .NearlyEveryDay),
                        makeStepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .NearlyEveryDay),
                        makeStepResult(.FeelingSuicidal, value: .NearlyEveryDay)
                    ],
                    "score": 27
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "score": 0
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .SeveralDays),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "score": 1
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .SeveralDays),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .SeveralDays),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "score": 2
                ]
            }
            
            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NearlyEveryDay),
                        makeStepResult(.LowSelfEsteem, value: .SeveralDays),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .SeveralDays),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "score": 8
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .SeveralDays),
                        makeStepResult(.FeelingTired, value: .SeveralDays),
                        makeStepResult(.PoorAppetite, value: .NearlyEveryDay),
                        makeStepResult(.LowSelfEsteem, value: .SeveralDays),
                        makeStepResult(.TroubleConcentrating, value: .SeveralDays),
                        makeStepResult(.SlowOrFast, value: .SeveralDays),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .NotAtAll),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "severity": Severity.NoDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .SeveralDays),
                        makeStepResult(.TroubleSleeping, value: .NotAtAll),
                        makeStepResult(.FeelingTired, value: .NotAtAll),
                        makeStepResult(.PoorAppetite, value: .NotAtAll),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "severity": Severity.MinimalDepression.rawValue
                ]
            }
            
            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .SeveralDays),
                        makeStepResult(.FeelingTired, value: .SeveralDays),
                        makeStepResult(.PoorAppetite, value: .SeveralDays),
                        makeStepResult(.LowSelfEsteem, value: .NotAtAll),
                        makeStepResult(.TroubleConcentrating, value: .NotAtAll),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "severity": Severity.MildDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NotAtAll),
                        makeStepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .SeveralDays),
                        makeStepResult(.FeelingTired, value: .SeveralDays),
                        makeStepResult(.PoorAppetite, value: .SeveralDays),
                        makeStepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .NotAtAll),
                        makeStepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "severity": Severity.ModerateDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleSleeping, value: .SeveralDays),
                        makeStepResult(.FeelingTired, value: .SeveralDays),
                        makeStepResult(.PoorAppetite, value: .SeveralDays),
                        makeStepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .SeveralDays),
                        makeStepResult(.FeelingSuicidal, value: .MoreThanHalfTheDays)
                    ],
                    "severity": Severity.ModeratelySevereDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .MoreThanHalfTheDays),
                        makeStepResult(.FeelingTired, value: .NearlyEveryDay),
                        makeStepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        makeStepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        makeStepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .SeveralDays),
                        makeStepResult(.FeelingSuicidal, value: .MoreThanHalfTheDays)
                    ],
                    "severity": Severity.SevereDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        makeStepResult(.LosingInterest, value: .NearlyEveryDay),
                        makeStepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        makeStepResult(.TroubleSleeping, value: .NearlyEveryDay),
                        makeStepResult(.FeelingTired, value: .NearlyEveryDay),
                        makeStepResult(.PoorAppetite, value: .NearlyEveryDay),
                        makeStepResult(.LowSelfEsteem, value: .NearlyEveryDay),
                        makeStepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        makeStepResult(.SlowOrFast, value: .NearlyEveryDay),
                        makeStepResult(.FeelingSuicidal, value: .NearlyEveryDay)
                    ],
                    "severity": Severity.SevereDepression.rawValue
                ]
            }

        }
        
        describe(".answers") {
        
            var evaluation: Evaluation!
            
            beforeEach {
                let stepResults = [
                    makeStepResult(.LosingInterest, value: .NearlyEveryDay),
                    makeStepResult(.FeelingDepressed, value: .SeveralDays),
                    makeStepResult(.TroubleSleeping, value: .NearlyEveryDay),
                    makeStepResult(.FeelingTired, value: .SeveralDays),
                    makeStepResult(.PoorAppetite, value: .NotAtAll),
                    makeStepResult(.LowSelfEsteem, value: .NearlyEveryDay),
                    makeStepResult(.TroubleConcentrating, value: .SeveralDays),
                    makeStepResult(.SlowOrFast, value: .MoreThanHalfTheDays),
                    makeStepResult(.FeelingSuicidal, value: .NotAtAll)
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
                
                for (idx, answer) in evaluation.answers.enumerate() {
                    expect(answer.question.identifier).to(equal(identifiers[idx]))
                }
            }

            it("has questions with the correct answer scores") {
                let values: [PHQ9ChoiceValue] = [
                    .NearlyEveryDay,
                    .SeveralDays,
                    .NearlyEveryDay,
                    .SeveralDays,
                    .NotAtAll,
                    .NearlyEveryDay,
                    .SeveralDays,
                    .MoreThanHalfTheDays,
                    .NotAtAll
                ]
                
                for (idx, answer) in evaluation.answers.enumerate() {
                    expect(answer.answerScore).to(equal(values[idx]))
                }
                
            }

        }
    }
    
}

//MARK: Helpers

internal func makeStepResult(identifier: QuestionIdentifier, value: PHQ9ChoiceValue) -> ORKStepResult {
    let result = ORKStepResult()
    result.identifier = identifier.rawValue
    result.results = [choiceResult(value)]
    
    return result
}

private func choiceResult(value: PHQ9ChoiceValue) -> ORKChoiceQuestionResult {
    let result = ORKChoiceQuestionResult()
    
    result.choiceAnswers = [value.rawValue]
    
    return result
}