import UIKit
import SafariServices

class EvaluationViewController: UIViewController {

    var viewModel: EvaluationViewModel? {
        didSet {
            if let viewModel = viewModel {
                updateUIWithViewModel(viewModel)
            }
        }
    }

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var additionalLabel: UILabel!

    @IBOutlet weak var findHelpButton: UIButton!
    @IBOutlet weak var findHelpLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let viewModel = viewModel {
            updateUIWithViewModel(viewModel)
        }

        NotificationCenter.default.addObserver(self, selector: #selector(fontSizeChanged), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsViewController = segue.destination as? EvaluationDetailsViewController {
            detailsViewController.viewModel = viewModel
        }
    }

    @IBAction func findHelpTapped(_ sender: AnyObject) {
        guard let url = viewModel?.findingHelpViewModel?.url else { return }
        let safariViewController = SFSafariViewController(url: url as URL)
        safariViewController.preferredControlTintColor = Appearance.darkPurple
        present(safariViewController, animated: true, completion: nil)
    }

    @objc private func fontSizeChanged() {
        if let viewModel = viewModel {
            updateUIWithViewModel(viewModel)
        }
    }

    func updateUIWithViewModel(_ viewModel: EvaluationViewModel) {
        guard isViewLoaded else { return }

        let diagnosisText = viewModel.diagnosisText as NSString

        let font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: traitCollection)
        let boldFont = UIFont.boldSystemFont(ofSize: font.pointSize)

        let attributedDiagnosisText = NSMutableAttributedString(string: viewModel.diagnosisText,
                                                                attributes: [.font: font])

        let diagnosisRange = diagnosisText.range(of: viewModel.diagnosis)

        attributedDiagnosisText.addAttribute(.font, value: boldFont, range: diagnosisRange)

        resultLabel.attributedText = attributedDiagnosisText
        additionalLabel.text = viewModel.suicidalText

        if viewModel.shouldDisplayFindingHelpInformation {
            findHelpButton.isHidden = false
            findHelpLabel.isHidden = false
            findHelpLabel.text = viewModel.findingHelpViewModel!.credits
        } else {
            findHelpButton.isHidden = true
            findHelpLabel.isHidden = true
        }
    }

}
