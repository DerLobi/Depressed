@testable import Depressed
import Foundation
import Nimble
import Quick
import ResearchKit

class EvaluationViewModelSpec: QuickSpec {
    
    override func spec() {
        
        var evaluation = MutableEvaluation()
        
        var viewModel: EvaluationViewModel!
        
        describe(".diagnosis") {
            
            context(".depressiveDisorderConsidered on the evaluation is false") {

                beforeEach {
                    evaluation.depressiveDisorderConsidered = false
                    evaluation.severity = .mildDepression
                    viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                }
                
                it("is the localized string diagnosis_no_depression") {
                    expect(viewModel.diagnosis).to(equal(NSLocalizedString("diagnosis_no_depression", comment: "")))
                }
            }
            
            context(".depressiveDisorderConsidered on the evaluation is true") {

                beforeEach {
                    evaluation.depressiveDisorderConsidered = true
                }
                
                context(".severity on the evaluation is NoDepression") {
                    
                    beforeEach {
                        evaluation.severity = .noDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    }

                    it("is the localized string diagnosis_no_depression") {
                        expect(viewModel.diagnosis).to(equal(NSLocalizedString("diagnosis_no_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is MinimalDepression") {
                    
                    beforeEach {
                        evaluation.severity = .minimalDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    }
                    
                    it("is the localized string diagnosis_minimal_depression") {
                        expect(viewModel.diagnosis).to(equal(NSLocalizedString("diagnosis_minimal_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is MildDepression") {
                    
                    beforeEach {
                        evaluation.severity = .mildDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    }
                    
                    it("is the localized string diagnosis_mild_depression") {
                        expect(viewModel.diagnosis).to(equal(NSLocalizedString("diagnosis_mild_depression", comment: "")))
                    }
                }

                context(".severity on the evaluation is ModerateDepression") {
                    
                    beforeEach {
                        evaluation.severity = .moderateDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    }
                    
                    it("is the localized string diagnosis_moderate_depression") {
                        expect(viewModel.diagnosis).to(equal(NSLocalizedString("diagnosis_moderate_depression", comment: "")))
                    }
                }

                context(".severity on the evaluation is ModeratelySevereDepression") {
                    
                    beforeEach {
                        evaluation.severity = .moderatelySevereDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    }
                    
                    it("is the localized string diagnosis_moderately_severe_depression") {
                        expect(viewModel.diagnosis).to(equal(NSLocalizedString("diagnosis_moderately_severe_depression", comment: "")))
                    }
                }

                context(".severity on the evaluation is SevereDepression") {
                    
                    beforeEach {
                        evaluation.severity = .severeDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    }
                    
                    it("is the localized string diagnosis_severe_depression") {
                        expect(viewModel.diagnosis).to(equal(NSLocalizedString("diagnosis_severe_depression", comment: "")))
                    }
                }

            }
            
        }
        
        describe(".diagnosisText") {
            
            context(".depressiveDisorderConsidered on the evaluation is false") {
                
                beforeEach {
                    evaluation.depressiveDisorderConsidered = false
                    evaluation.severity = .mildDepression
                    viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                }
                
                it("is the localized string diagnosis_text_no_depression") {
                    expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_no_depression", comment: "")))
                }
            }
            
            context(".depressiveDisorderConsidered on the evaluation is true") {
                
                beforeEach {
                    evaluation.depressiveDisorderConsidered = true
                }
                
                context(".severity on the evaluation is NoDepression") {
                    
                    beforeEach {
                        evaluation.severity = .noDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    }
                    
                    it("is the localized string diagnosis_text_no_depression") {
                        expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_no_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is MinimalDepression") {
                    
                    beforeEach {
                        evaluation.severity = .minimalDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    }
                    
                    it("is the localized string diagnosis_text_minimal_depression") {
                        expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_minimal_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is MildDepression") {
                    
                    beforeEach {
                        evaluation.severity = .mildDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    }
                    
                    it("is the localized string diagnosis_text_mild_depression") {
                        expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_mild_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is ModerateDepression") {
                    
                    beforeEach {
                        evaluation.severity = .moderateDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    }
                    
                    it("is the localized string diagnosis_text_moderate_depression") {
                        expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_moderate_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is ModeratelySevereDepression") {
                    
                    beforeEach {
                        evaluation.severity = .moderatelySevereDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    }
                    
                    it("is the localized string diagnosis_text_moderately_severe_depression") {
                        expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_moderately_severe_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is SevereDepression") {
                    
                    beforeEach {
                        evaluation.severity = .severeDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    }
                    
                    it("is the localized string diagnosis_text_severe_depression") {
                        expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_severe_depression", comment: "")))
                    }
                }

            }
        }
        
        describe(".explanationText") {
            
            context("a depressive order is considered") {
                
                beforeEach {
                    evaluation.depressiveDisorderConsidered = true
                    viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                }
                
                it("returns the localized string 'explanation_depression'") {
                    expect(viewModel.explanationText).to(equal(NSLocalizedString("explanation_depression", comment: "")))
                }
                
            }
            
            context("a depressive order is not considered") {
                
                beforeEach {
                    evaluation.depressiveDisorderConsidered = false
                }
                
                sharedExamples("returns the correct explanation") { (context: SharedExampleContext) in
                    let numberCritical = context()["numberOfAnswersCritical"] as! Bool
                    let losingInterestCritical = context()["losingInterestCritical"] as! Bool
                    let feelingDepressedCritical = context()["feelingDepressedCritical"] as! Bool
                    let expectedExplanation = context()["explanation"] as! String
                    
                
                    evaluation.numberOfAnswersCritical = numberCritical
                    evaluation.losingInterestCritical = losingInterestCritical
                    evaluation.feelingDepressedCritical = feelingDepressedCritical
                    
                    let viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                    
                    it("decides correctly") {
                        expect(viewModel.explanationText).to(equal(expectedExplanation))
                    }
                }
                
                itBehavesLike("returns the correct explanation") {
                    return [
                        "numberOfAnswersCritical": false,
                        "losingInterestCritical": false,
                        "feelingDepressedCritical": false,
                        "explanation": NSLocalizedString("explanation_no_depression_not_enough_answers_critical", comment: "")
                    ]
                }

                itBehavesLike("returns the correct explanation") {
                    return [
                        "numberOfAnswersCritical": false,
                        "losingInterestCritical": true,
                        "feelingDepressedCritical": false,
                        "explanation": NSLocalizedString("explanation_no_depression_not_enough_answers_critical", comment: "")
                    ]
                }
                
                itBehavesLike("returns the correct explanation") {
                    return [
                        "numberOfAnswersCritical": false,
                        "losingInterestCritical": false,
                        "feelingDepressedCritical": true,
                        "explanation": NSLocalizedString("explanation_no_depression_not_enough_answers_critical", comment: "")
                    ]
                }

                itBehavesLike("returns the correct explanation") {
                    return [
                        "numberOfAnswersCritical": false,
                        "losingInterestCritical": true,
                        "feelingDepressedCritical": true,
                        "explanation": NSLocalizedString("explanation_no_depression_not_enough_answers_critical", comment: "")
                    ]
                }

                itBehavesLike("returns the correct explanation") {
                    return [
                        "numberOfAnswersCritical": true,
                        "losingInterestCritical": false,
                        "feelingDepressedCritical": false,
                        "explanation": NSLocalizedString("explanation_no_depression_first_questions_not_critical", comment: "")
                    ]
                }

                
            }
        }

        describe(".suicidalText") {
            
            context(".suicidal on the evaluation is false") {
                
                beforeEach {
                    evaluation.suicidal = false
                    viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                }

                it("is nil") {
                    expect(viewModel.suicidalText).to(beNil())
                }
            }

            context(".suicidal on the evaluation is true") {
                
                beforeEach {
                    evaluation.suicidal = true
                    viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                }
                
                it("is the localized string suicidal_text") {
                    expect(viewModel.suicidalText).to(equal(NSLocalizedString("suicidal_text", comment: "")))
                }
            }
        }
    
        describe(".score") {
            
            beforeEach {
                evaluation.score = 23
                viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
            }
            
            it("is equal to the evaluation's score") {
                expect(viewModel.score).to(equal("23"))
                
            }
        }
        
        describe(".shouldDisplayScore") {

            context("a depressive disorder is considered") {
                
                beforeEach {
                    evaluation.depressiveDisorderConsidered = true
                    viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                }
                
                it("returns true") {
                    expect(viewModel.shouldDisplayScore).to(beTrue())
                }
                
            }

            context("a depressive disorder is not considered") {

                beforeEach {
                    evaluation.depressiveDisorderConsidered = false
                    viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                }
                
                it("returns false") {
                    expect(viewModel.shouldDisplayScore).to(beFalse())
                }
                
            }
        }
        
        describe(".answers") {
            
            beforeEach {
                let stepResult = makeStepResult(.feelingTired, value: .moreThanHalfTheDays)
                
                let answer = Answer(stepResult: stepResult)!

                evaluation.answers = [answer]
                viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
            }
            
            it("is equal to the evaluation's score") {
                let answerTuple = viewModel.answers.first!
                expect(answerTuple.0).to(equal(NSLocalizedString("question_title_feeling_tired", comment: "")))
                expect(answerTuple.1).to(equal("2"))
            }
        }
        
        describe(".shouldDisplayFindingHelpInformation") {
            
            context("it gets initialized with a FindingHelpInformation") {

                beforeEach {
                    let info = FindingHelpInformation(url: URL(string: "http://example.com")!, organizationName: "Example Alliance Against Depression")
                    viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: info, settings: SettingsMock())
                }
                
                it("returns false") {
                    expect(viewModel.shouldDisplayFindingHelpInformation).to(beTrue())
                }
            }
            
            context("it gets initialized without a FindingHelpInformation") {

                beforeEach {
                    viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                }
                
                it("returns false") {
                    expect(viewModel.shouldDisplayFindingHelpInformation).to(beFalse())
                }
            }
        }
        
        describe(".findingHelpViewModel") {
            
            context("it gets initialized with a FindingHelpInformation") {
                
                beforeEach {
                    let info = FindingHelpInformation(url: URL(string: "http://example.com")!, organizationName: "Example Alliance Against Depression")
                    viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: info, settings: SettingsMock())
                }
                
                it("is not nil") {
                    expect(viewModel.findingHelpViewModel).toNot(beNil())
                }
            }
            
            context("it gets initialized without a FindingHelpInformation") {
                
                beforeEach {
                    viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: nil, settings: SettingsMock())
                }
                
                it("is nil") {
                    expect(viewModel.findingHelpViewModel).to(beNil())
                }
            }
        }

        describe(".shouldPromptForReview") {

            context("the survey has not been finished before") {

                beforeEach {
                    let settings = SettingsMock()
                    settings.didShowRatingPrompt = false
                    settings.numberOfFinishedSurveys = 0

                    viewModel = EvaluationViewModel(evaluation: evaluation,
                                                    findingHelpInformation: nil,
                                                    settings: settings)
                }

                it("returns false") {
                    expect(viewModel.shouldPromptForReview).to(beFalse())
                }

            }

            context("the survey has been finished once") {
                beforeEach {
                    let settings = SettingsMock()
                    settings.didShowRatingPrompt = false
                    settings.numberOfFinishedSurveys = 1

                    viewModel = EvaluationViewModel(evaluation: evaluation,
                                                    findingHelpInformation: nil,
                                                    settings: settings)
                }

                it("returns false") {
                    expect(viewModel.shouldPromptForReview).to(beFalse())
                }

            }

            context("the survey has been finished twice") {
                beforeEach {
                    let settings = SettingsMock()
                    settings.didShowRatingPrompt = false
                    settings.numberOfFinishedSurveys = 2

                    viewModel = EvaluationViewModel(evaluation: evaluation,
                                                    findingHelpInformation: nil,
                                                    settings: settings)
                }

                it("returns true") {
                    expect(viewModel.shouldPromptForReview).to(beTrue())
                }

            }

            context("the survey has been finished more than once before") {

                context("the prompt has not been shown before") {

                    beforeEach {
                        let settings = SettingsMock()
                        settings.didShowRatingPrompt = false
                        settings.numberOfFinishedSurveys = 3

                        viewModel = EvaluationViewModel(evaluation: evaluation,
                                                        findingHelpInformation: nil,
                                                        settings: settings)
                    }

                    it("returns true") {
                        expect(viewModel.shouldPromptForReview).to(beTrue())
                    }

                }

                context("the prompt has been shown before") {

                    beforeEach {
                        let settings = SettingsMock()
                        settings.didShowRatingPrompt = true
                        settings.numberOfFinishedSurveys = 3

                        viewModel = EvaluationViewModel(evaluation: evaluation,
                                                        findingHelpInformation: nil,
                                                        settings: settings)
                    }

                    it("returns false") {
                        expect(viewModel.shouldPromptForReview).to(beFalse())
                    }

                }
            }
        }
    }
}
