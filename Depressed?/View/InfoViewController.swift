import UIKit

class InfoViewController: UIViewController {

    @IBAction func dismiss(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

}
