import UIKit

class EvaluationViewController: UIViewController {
    
    var viewModel: EvaluationViewModel? {
        didSet {
            if let viewModel = viewModel {
                updateLabelsWithViewModel(viewModel)
            }
        }
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var additionalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let viewModel = viewModel {
            updateLabelsWithViewModel(viewModel)
        }
    }

    private func updateLabelsWithViewModel(viewModel: EvaluationViewModel) {
        guard isViewLoaded() else { return }
        
        let diagnosisText = viewModel.diagnosisText as NSString
        
        let attributedDiagnosisText = NSMutableAttributedString(string: viewModel.diagnosisText)
        let diagnosisRange = diagnosisText.rangeOfString(viewModel.diagnosis)

        attributedDiagnosisText.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(17.0), range: diagnosisRange)
        
        resultLabel.attributedText = attributedDiagnosisText
        additionalLabel.text = viewModel.suicidalText
    }
    
}
