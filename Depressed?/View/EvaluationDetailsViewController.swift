import UIKit

private enum EvaluationDetailsSection: Int {
    case Explanation
    case AnswersHeader
    case Answers
    case Score
    case ScoreMapping
    case Count
}

class EvaluationDetailsViewController: UITableViewController {

    var viewModel: EvaluationViewModel? {
        didSet {
            if let _ = viewModel {
                tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 96
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell: UITableViewCell?

        switch indexPath.section {
        case EvaluationDetailsSection.Explanation.rawValue:
            cell = tableView.dequeueReusableCellWithIdentifier("explanation", forIndexPath: indexPath)
            if let cell = cell as? ExplanationCell, viewModel = viewModel {
                cell.label.text = viewModel.explanationText
            }
        case EvaluationDetailsSection.AnswersHeader.rawValue:
            cell = tableView.dequeueReusableCellWithIdentifier("answersHeader", forIndexPath: indexPath)
        case EvaluationDetailsSection.Answers.rawValue:
            cell = tableView.dequeueReusableCellWithIdentifier("answer", forIndexPath: indexPath)
            if let cell = cell as? AnswerCell, viewModel = viewModel {
                let (question, score) = viewModel.answers[indexPath.row]
                cell.questionLabel.text = question
                cell.scoreLabel.text = score
            }
        case EvaluationDetailsSection.Score.rawValue:
            cell = tableView.dequeueReusableCellWithIdentifier("score", forIndexPath: indexPath)
            if let cell = cell as? ScoreCell, viewModel = viewModel {
                cell.scoreLabel.text = viewModel.score
                cell.diagnosisLabel.text = viewModel.diagnosis
            }

        case EvaluationDetailsSection.ScoreMapping.rawValue:
            cell = tableView.dequeueReusableCellWithIdentifier("mapping", forIndexPath: indexPath)
        default:
            break
        }

        return cell!
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let viewModel = viewModel {
            if viewModel.shouldDisplayScore {
                return EvaluationDetailsSection.Count.rawValue
            } else {
                return 1
            }
        }
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == EvaluationDetailsSection.Answers.rawValue {
            return viewModel?.answers.count ?? 0
        }

        return 1
    }
}
