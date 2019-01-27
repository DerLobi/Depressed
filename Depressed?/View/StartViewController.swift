import UIKit
import ResearchKit

class StartViewController: UIViewController, ORKTaskViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem?.accessibilityLabel = NSLocalizedString("infobutton.accessibilityLabel", comment: "")
    }

    override func accessibilityPerformMagicTap() -> Bool {
        startTest(self)
        return true
    }

    @IBAction func startTest(_ sender: AnyObject) {

        let task = SelfTestTask.task()
        let taskController = ORKTaskViewController(task: task, taskRun: nil)
        taskController.delegate = self
        taskController.modalPresentationStyle = .pageSheet
        taskController.navigationBar.prefersLargeTitles = false
        taskController.navigationBar.titleTextAttributes = [
            .foregroundColor: Appearance.endeavour
        ]
        present(taskController, animated: true, completion: nil)
    }

    // MARK: - ORKTaskViewControllerDelegate

    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {

        if reason == .completed, let results = taskViewController.result.results as? [ORKStepResult] {

            let evaluation = Evaluation(stepResults: results)

            if let evaluation = evaluation {

                let findingHelpInformation = FindingHelpInformation(locale: Locale.current)
                let viewModel = EvaluationViewModel(evaluation: evaluation, findingHelpInformation: findingHelpInformation)
                // swiftlint:disable:next force_cast
                let evaluationViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EvaluationViewController") as! EvaluationViewController
                evaluationViewController.viewModel = viewModel

                navigationController?.pushViewController(evaluationViewController, animated: false)

            }
        }

        dismiss(animated: true) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

}
