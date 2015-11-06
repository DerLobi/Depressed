//
//  EvaluationViewModelSpec.swift
//  Depressed?
//
//  Created by Christian Lobach on 06/11/15.
//  Copyright © 2015 Christian Lobach. All rights reserved.
//

import Depressed
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
                    evaluation.severity = .MildDepression
                    viewModel = EvaluationViewModel(evaluation: evaluation)
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
                        evaluation.severity = .NoDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation)
                    }

                    it("is the localized string diagnosis_no_depression") {
                        expect(viewModel.diagnosis).to(equal(NSLocalizedString("diagnosis_no_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is MinimalDepression") {
                    
                    beforeEach {
                        evaluation.severity = .MinimalDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation)
                    }
                    
                    it("is the localized string diagnosis_minimal_depression") {
                        expect(viewModel.diagnosis).to(equal(NSLocalizedString("diagnosis_minimal_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is MildDepression") {
                    
                    beforeEach {
                        evaluation.severity = .MildDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation)
                    }
                    
                    it("is the localized string diagnosis_mild_depression") {
                        expect(viewModel.diagnosis).to(equal(NSLocalizedString("diagnosis_mild_depression", comment: "")))
                    }
                }

                context(".severity on the evaluation is ModerateDepression") {
                    
                    beforeEach {
                        evaluation.severity = .ModerateDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation)
                    }
                    
                    it("is the localized string diagnosis_moderate_depression") {
                        expect(viewModel.diagnosis).to(equal(NSLocalizedString("diagnosis_moderate_depression", comment: "")))
                    }
                }

                context(".severity on the evaluation is ModeratelySevereDepression") {
                    
                    beforeEach {
                        evaluation.severity = .ModeratelySevereDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation)
                    }
                    
                    it("is the localized string diagnosis_moderately_severe_depression") {
                        expect(viewModel.diagnosis).to(equal(NSLocalizedString("diagnosis_moderately_severe_depression", comment: "")))
                    }
                }

                context(".severity on the evaluation is SevereDepression") {
                    
                    beforeEach {
                        evaluation.severity = .SevereDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation)
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
                    evaluation.severity = .MildDepression
                    viewModel = EvaluationViewModel(evaluation: evaluation)
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
                        evaluation.severity = .NoDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation)
                    }
                    
                    it("is the localized string diagnosis_text_no_depression") {
                        expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_no_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is MinimalDepression") {
                    
                    beforeEach {
                        evaluation.severity = .MinimalDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation)
                    }
                    
                    it("is the localized string diagnosis_text_minimal_depression") {
                        expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_minimal_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is MildDepression") {
                    
                    beforeEach {
                        evaluation.severity = .MildDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation)
                    }
                    
                    it("is the localized string diagnosis_text_mild_depression") {
                        expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_mild_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is ModerateDepression") {
                    
                    beforeEach {
                        evaluation.severity = .ModerateDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation)
                    }
                    
                    it("is the localized string diagnosis_text_moderate_depression") {
                        expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_moderate_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is ModeratelySevereDepression") {
                    
                    beforeEach {
                        evaluation.severity = .ModeratelySevereDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation)
                    }
                    
                    it("is the localized string diagnosis_text_moderately_severe_depression") {
                        expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_moderately_severe_depression", comment: "")))
                    }
                }
                
                context(".severity on the evaluation is SevereDepression") {
                    
                    beforeEach {
                        evaluation.severity = .SevereDepression
                        viewModel = EvaluationViewModel(evaluation: evaluation)
                    }
                    
                    it("is the localized string diagnosis_text_severe_depression") {
                        expect(viewModel.diagnosisText).to(equal(NSLocalizedString("diagnosis_text_severe_depression", comment: "")))
                    }
                }

            }
        }

        describe(".suicidalText") {
            
            context(".suicidal on the evaluation is false") {
                
                beforeEach {
                    evaluation.suicidal = false
                    viewModel = EvaluationViewModel(evaluation: evaluation)
                }

                it("is nil") {
                    expect(viewModel.suicidalText).to(beNil())
                }
            }

            context(".suicidal on the evaluation is true") {
                
                beforeEach {
                    evaluation.suicidal = true
                    viewModel = EvaluationViewModel(evaluation: evaluation)
                }
                
                it("is the localized string suicidal_text") {
                    expect(viewModel.suicidalText).to(equal(NSLocalizedString("suicidal_text", comment: "")))
                }
            }
        }
    }
}
 