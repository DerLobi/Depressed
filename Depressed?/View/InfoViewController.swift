import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var versionLabel: UILabel!

    var viewModel = InfoViewModel()

    @IBAction func dismiss(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        versionLabel.text = viewModel.versionInformation
    }
    
}
