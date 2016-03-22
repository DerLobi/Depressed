import UIKit
import ResearchKit

class StartViewController: UIViewController, ORKTaskViewControllerDelegate {

    @IBAction func startTest(sender: AnyObject) {

        let task = SelfTestTask()
        let taskController = ORKTaskViewController(task: task, taskRunUUID: nil)
        taskController.delegate = self
        taskController.modalPresentationStyle = .PageSheet

        UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: true)
        presentViewController(taskController, animated: true, completion: nil)
    }

    //MARK: - ORKTaskViewControllerDelegate

    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {

        if reason == .Completed, let results = taskViewController.result.results as? [ORKStepResult] {

            let evaluation = Evaluation(stepResults: results)

            if let evaluation = evaluation {

                let findingHelpInformation = FindingHelpInformation(locale: NSLocale.currentLocale())
                let viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: findingHelpInformation)
                // swiftlint:disable:next force_cast
                let evaluationViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("EvaluationViewController") as! EvaluationViewController
                evaluationViewController.viewModel = viewModel

                navigationController?.pushViewController(evaluationViewController, animated: false)

            }
        }

        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
        dismissViewControllerAnimated(true, completion: nil)
    }

}
