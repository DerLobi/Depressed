import UIKit
import ResearchKit

class StartViewController: UIViewController, ORKTaskViewControllerDelegate {

    @IBAction func startTest(_ sender: AnyObject) {

        let task = SelfTestTask()
        let taskController = ORKTaskViewController(task: task, taskRun: nil)
        taskController.delegate = self
        taskController.modalPresentationStyle = .pageSheet

        UIApplication.shared.setStatusBarStyle(.default, animated: true)
        present(taskController, animated: true, completion: nil)
    }

    //MARK: - ORKTaskViewControllerDelegate

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

        UIApplication.shared.setStatusBarStyle(.lightContent, animated: false)
        dismiss(animated: true, completion: nil)
    }

}
