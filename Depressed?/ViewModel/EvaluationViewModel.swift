import Foundation

public struct EvaluationViewModel {
    
    public let diagnosis: String
    public let diagnosisText: String
    
    public let suicidalText: String?
    
    public init(evaluation: EvaluationType) {
        
        if evaluation.depressiveDisorderConsidered {
            
            switch evaluation.severity {
            case .NoDepression:
                diagnosis = NSLocalizedString("diagnosis_no_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_no_depression", comment: "")
            case .MinimalDepression:
                diagnosis = NSLocalizedString("diagnosis_minimal_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_minimal_depression", comment: "")
            case .MildDepression:
                diagnosis = NSLocalizedString("diagnosis_mild_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_mild_depression", comment: "")
            case .ModerateDepression:
                diagnosis = NSLocalizedString("diagnosis_moderate_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_moderate_depression", comment: "")
            case .ModeratelySevereDepression:
                diagnosis = NSLocalizedString("diagnosis_moderately_severe_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_moderately_severe_depression", comment: "")
            case .SevereDepression:
                diagnosis = NSLocalizedString("diagnosis_severe_depression", comment: "")
                diagnosisText = NSLocalizedString("diagnosis_text_severe_depression", comment: "")
            }
        } else {
            diagnosis = NSLocalizedString("diagnosis_no_depression", comment: "")
            diagnosisText = NSLocalizedString("diagnosis_text_no_depression", comment: "")
        }
        
        if evaluation.suicidal {
            suicidalText = NSLocalizedString("suicidal_text", comment: "")
        } else {
            suicidalText = nil
        }
        
    }
    
}
