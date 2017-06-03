import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var versionLabel: UILabel!

    var viewModel = InfoViewModel()

    @IBAction func dismiss(_ sender: AnyObject) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        versionLabel.text = viewModel.versionInformation
    }

}
