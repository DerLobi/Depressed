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
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailsViewController = segue.destinationViewController as? EvaluationDetailsViewController {
            detailsViewController.viewModel = viewModel
        }
    }

    @IBAction func findHelpTapped(sender: AnyObject) {
        guard let url = viewModel?.findingHelpViewModel?.url else { return }

        if #available(iOS 9.0, *) {
            let safariViewController = SFSafariViewController(URL: url)
            safariViewController.delegate = self
            UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: true)
            presentViewController(safariViewController, animated: true, completion: nil)
        } else {
            UIApplication.sharedApplication().openURL(url)
        }
    }

    private func updateUIWithViewModel(viewModel: EvaluationViewModel) {
        guard isViewLoaded() else { return }

        let diagnosisText = viewModel.diagnosisText as NSString

        let attributedDiagnosisText = NSMutableAttributedString(string: viewModel.diagnosisText)
        let diagnosisRange = diagnosisText.rangeOfString(viewModel.diagnosis)

        attributedDiagnosisText.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(17.0), range: diagnosisRange)

        resultLabel.attributedText = attributedDiagnosisText
        additionalLabel.text = viewModel.suicidalText

        if viewModel.shouldDisplayFindingHelpInformation {
            findHelpButton.hidden = false
            findHelpLabel.hidden = false
            findHelpLabel.text = viewModel.findingHelpViewModel!.credits
        } else {
            findHelpButton.hidden = true
            findHelpLabel.hidden = true
        }
    }

}

@available(iOS 9.0, *)
extension EvaluationViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: true)
    }
}
