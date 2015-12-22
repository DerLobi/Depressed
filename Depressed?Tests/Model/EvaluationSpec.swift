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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NearlyEveryDay),
                        stepResult(.FeelingTired, value: .NearlyEveryDay),
                        stepResult(.PoorAppetite, value: .NearlyEveryDay),
                        stepResult(.LowSelfEsteem, value: .NearlyEveryDay),
                        stepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        stepResult(.SlowOrFast, value: .NearlyEveryDay),
                        stepResult(.FeelingSuicidal, value: .NearlyEveryDay)
                    ],
                    "considered": false
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NearlyEveryDay),
                        stepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "considered": false
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        stepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        stepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "considered": true
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        stepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleConcentrating, value: .MoreThanHalfTheDays),
                        stepResult(.SlowOrFast, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "considered": true
                ]
            }

            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleSleeping, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        stepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        stepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "considered": true
                ]
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        stepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleConcentrating, value: .MoreThanHalfTheDays),
                        stepResult(.SlowOrFast, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "considered": true
                ]
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        stepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        stepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .SeveralDays)
                    ],
                    "considered": true
                ]
            }
            
            itBehavesLike("returns the correct decision") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        stepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        stepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .SeveralDays)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .SeveralDays)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .MoreThanHalfTheDays)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NearlyEveryDay)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .SeveralDays),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .NearlyEveryDay),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .SeveralDays),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .NearlyEveryDay),
                        stepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        stepResult(.TroubleSleeping, value: .NearlyEveryDay),
                        stepResult(.FeelingTired, value: .NearlyEveryDay),
                        stepResult(.PoorAppetite, value: .NearlyEveryDay),
                        stepResult(.LowSelfEsteem, value: .NearlyEveryDay),
                        stepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        stepResult(.SlowOrFast, value: .NearlyEveryDay),
                        stepResult(.FeelingSuicidal, value: .NearlyEveryDay)
                    ],
                    "critical": true
                ]
            }
            
            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleSleeping, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "critical": true
                ]
            }
        
            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleConcentrating, value: .MoreThanHalfTheDays),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "critical": true
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleConcentrating, value: .MoreThanHalfTheDays),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "critical": true
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .MoreThanHalfTheDays),
                        stepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        stepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleConcentrating, value: .MoreThanHalfTheDays),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .MoreThanHalfTheDays)
                    ],
                    "critical": true
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NearlyEveryDay),
                        stepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NearlyEveryDay)
                    ],
                    "critical": false
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "critical": false
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .SeveralDays),
                        stepResult(.FeelingDepressed, value: .SeveralDays),
                        stepResult(.TroubleSleeping, value: .SeveralDays),
                        stepResult(.FeelingTired, value: .SeveralDays),
                        stepResult(.PoorAppetite, value: .SeveralDays),
                        stepResult(.LowSelfEsteem, value: .SeveralDays),
                        stepResult(.TroubleConcentrating, value: .SeveralDays),
                        stepResult(.SlowOrFast, value: .SeveralDays),
                        stepResult(.FeelingSuicidal, value: .SeveralDays)
                    ],
                    "critical": false
                ]
            }

            itBehavesLike("returns whether four or more questions are answered critically") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NearlyEveryDay),
                        stepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        stepResult(.TroubleSleeping, value: .SeveralDays),
                        stepResult(.FeelingTired, value: .SeveralDays),
                        stepResult(.PoorAppetite, value: .SeveralDays),
                        stepResult(.LowSelfEsteem, value: .SeveralDays),
                        stepResult(.TroubleConcentrating, value: .SeveralDays),
                        stepResult(.SlowOrFast, value: .SeveralDays),
                        stepResult(.FeelingSuicidal, value: .NearlyEveryDay)
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
                        stepResult(.LosingInterest, value: .NearlyEveryDay),
                        stepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        stepResult(.TroubleSleeping, value: .NearlyEveryDay),
                        stepResult(.FeelingTired, value: .NearlyEveryDay),
                        stepResult(.PoorAppetite, value: .NearlyEveryDay),
                        stepResult(.LowSelfEsteem, value: .NearlyEveryDay),
                        stepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        stepResult(.SlowOrFast, value: .NearlyEveryDay),
                        stepResult(.FeelingSuicidal, value: .NearlyEveryDay)
                    ],
                    "score": 27
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "score": 0
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .SeveralDays),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "score": 1
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .SeveralDays),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .SeveralDays),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "score": 2
                ]
            }
            
            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NearlyEveryDay),
                        stepResult(.LowSelfEsteem, value: .SeveralDays),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .SeveralDays),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "score": 8
                ]
            }

            itBehavesLike("calculates the correct score") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NearlyEveryDay),
                        stepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        stepResult(.TroubleSleeping, value: .SeveralDays),
                        stepResult(.FeelingTired, value: .SeveralDays),
                        stepResult(.PoorAppetite, value: .NearlyEveryDay),
                        stepResult(.LowSelfEsteem, value: .SeveralDays),
                        stepResult(.TroubleConcentrating, value: .SeveralDays),
                        stepResult(.SlowOrFast, value: .SeveralDays),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
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
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .NotAtAll),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "severity": Severity.NoDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .SeveralDays),
                        stepResult(.TroubleSleeping, value: .NotAtAll),
                        stepResult(.FeelingTired, value: .NotAtAll),
                        stepResult(.PoorAppetite, value: .NotAtAll),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "severity": Severity.MinimalDepression.rawValue
                ]
            }
            
            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleSleeping, value: .SeveralDays),
                        stepResult(.FeelingTired, value: .SeveralDays),
                        stepResult(.PoorAppetite, value: .SeveralDays),
                        stepResult(.LowSelfEsteem, value: .NotAtAll),
                        stepResult(.TroubleConcentrating, value: .NotAtAll),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "severity": Severity.MildDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NotAtAll),
                        stepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleSleeping, value: .SeveralDays),
                        stepResult(.FeelingTired, value: .SeveralDays),
                        stepResult(.PoorAppetite, value: .SeveralDays),
                        stepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        stepResult(.SlowOrFast, value: .NotAtAll),
                        stepResult(.FeelingSuicidal, value: .NotAtAll)
                    ],
                    "severity": Severity.ModerateDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingDepressed, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleSleeping, value: .SeveralDays),
                        stepResult(.FeelingTired, value: .SeveralDays),
                        stepResult(.PoorAppetite, value: .SeveralDays),
                        stepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        stepResult(.SlowOrFast, value: .SeveralDays),
                        stepResult(.FeelingSuicidal, value: .MoreThanHalfTheDays)
                    ],
                    "severity": Severity.ModeratelySevereDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        stepResult(.TroubleSleeping, value: .MoreThanHalfTheDays),
                        stepResult(.FeelingTired, value: .NearlyEveryDay),
                        stepResult(.PoorAppetite, value: .MoreThanHalfTheDays),
                        stepResult(.LowSelfEsteem, value: .MoreThanHalfTheDays),
                        stepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        stepResult(.SlowOrFast, value: .SeveralDays),
                        stepResult(.FeelingSuicidal, value: .MoreThanHalfTheDays)
                    ],
                    "severity": Severity.SevereDepression.rawValue
                ]
            }

            itBehavesLike("returns the correct severity") {
                return [
                    "results": [
                        stepResult(.LosingInterest, value: .NearlyEveryDay),
                        stepResult(.FeelingDepressed, value: .NearlyEveryDay),
                        stepResult(.TroubleSleeping, value: .NearlyEveryDay),
                        stepResult(.FeelingTired, value: .NearlyEveryDay),
                        stepResult(.PoorAppetite, value: .NearlyEveryDay),
                        stepResult(.LowSelfEsteem, value: .NearlyEveryDay),
                        stepResult(.TroubleConcentrating, value: .NearlyEveryDay),
                        stepResult(.SlowOrFast, value: .NearlyEveryDay),
                        stepResult(.FeelingSuicidal, value: .NearlyEveryDay)
                    ],
                    "severity": Severity.SevereDepression.rawValue
                ]
            }

        }
        
    }
    
}

//MARK: Helpers

private func stepResult(identifier: QuestionIdentifier, value: PHQ9ChoiceValue) -> ORKStepResult {
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