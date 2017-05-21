import UIKit

private enum EvaluationDetailsSection: Int {
    case explanation
    case answersHeader
    case answers
    case score
    case scoreMapping
    case count
}

class EvaluationDetailsViewController: UITableViewController {

    var viewModel: EvaluationViewModel? {
        didSet {
            if viewModel != nil {
                tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 96
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell: UITableViewCell?

        switch indexPath.section {
        case EvaluationDetailsSection.explanation.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "explanation", for: indexPath)
            if let cell = cell as? ExplanationCell, let viewModel = viewModel {
                cell.label.text = viewModel.explanationText
            }
        case EvaluationDetailsSection.answersHeader.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "answersHeader", for: indexPath)
        case EvaluationDetailsSection.answers.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "answer", for: indexPath)
            if let cell = cell as? AnswerCell, let viewModel = viewModel {
                let (question, score) = viewModel.answers[indexPath.row]
                cell.questionLabel.text = question
                cell.scoreLabel.text = score
            }
        case EvaluationDetailsSection.score.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "score", for: indexPath)
            if let cell = cell as? ScoreCell, let viewModel = viewModel {
                cell.scoreLabel.text = viewModel.score
                cell.diagnosisLabel.text = viewModel.diagnosis
            }

        case EvaluationDetailsSection.scoreMapping.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "mapping", for: indexPath)
        default:
            break
        }

        return cell!
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        if let viewModel = viewModel {
            if viewModel.shouldDisplayScore {
                return EvaluationDetailsSection.count.rawValue
            } else {
                return 1
            }
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == EvaluationDetailsSection.answers.rawValue {
            return viewModel?.answers.count ?? 0
        }

        return 1
    }
}
