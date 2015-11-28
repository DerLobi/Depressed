import Foundation

///  Viewmodel transforming `Evaluation` model data for presentation to the user.
public struct EvaluationViewModel {
    
    /// Diagnosis of how severe the depression is.
    public let diagnosis: String

    /// Phrase describing the diagnosis.
    public let diagnosisText: String
    
    /// Warning message in case the user answered that they had thoughts
    /// about suicide or self harm.
    public let suicidalText: String?
    
    ///  Creates a new view model from the given evaluation.
    ///
    ///  - parameter evaluation: An `Evaluation`
    ///
    ///  - returns: a newly initialized `EvaluationViewModel` instance
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
