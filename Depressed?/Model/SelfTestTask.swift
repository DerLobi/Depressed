import ResearchKit

/// Task that contains the questions of the [PHQ-9](https://en.wikipedia.org/wiki/Patient_Health_Questionnaire#Versions) questionnaire.
public class SelfTestTask: NSObject, ORKTask {

    public let identifier = "SelfTest"    

    public func stepBeforeStep(step: ORKStep?, withResult result: ORKTaskResult) -> ORKStep? {
        if let step = step {
            // return appropiate step
            let index = steps().indexOf(step)
            if let index = index where index - 1 >= 0 {
                return steps()[index - 1]
            } else {
                return nil
            }
        } else {
            return nil
            
        }
    }

    public func stepAfterStep(step: ORKStep?, withResult result: ORKTaskResult) -> ORKStep? {

        if let step = step {
            // return appropiate step
            let index = steps().indexOf(step)
            if let index = index where index + 1 < steps().count {
                return steps()[index + 1]
            } else {
                return nil
            }
        } else {
            // return first step
            return steps().first!
        }

    }
    
    public func progressOfCurrentStep(step: ORKStep, withResult result: ORKTaskResult) -> ORKTaskProgress {
        let index = steps().indexOf(step)

        if let index = index {
            return ORKTaskProgressMake(UInt(index), UInt(steps().count))
        }
        
        return ORKTaskProgressMake(0, UInt(steps().count))
    }
    
    private func steps() -> [ORKStep] {

        let makeStep: (String, String, String) -> ORKQuestionStep = { identifier, title, text in
            let step = ORKQuestionStep(identifier: identifier, title: NSLocalizedString(title, comment: ""), answer: ORKTextChoiceAnswerFormat.phq9Format)
            step.text = NSLocalizedString(text, comment: "")
            step.optional = false
            return step
        }
        
        let pleasureInterestQuestion = makeStep(QuestionIdentifier.LosingInterest.rawValue,
            "question_title_losing_interest",
            "question_text_losing_interest")

        let depressedQuestion = makeStep(QuestionIdentifier.FeelingDepressed.rawValue,
            "question_title_feeling_depressed",
            "question_text_feeling_depressed")
        
        let sleepQuestion = makeStep(QuestionIdentifier.TroubleSleeping.rawValue,
            "question_title_trouble_sleeping",
            "question_text_trouble_sleeping")
        
        let tiredQuestion = makeStep(QuestionIdentifier.FeelingTired.rawValue,
            "question_title_feeling_tired",
            "question_text_feeling_tired")
        
        let appetiteQuestion = makeStep(QuestionIdentifier.PoorAppetite.rawValue,
            "question_title_poor_appetite",
            "question_text_poor_appetite")
        
        let selfEsteemQuestion = makeStep(QuestionIdentifier.LowSelfEsteem.rawValue,
            "question_title_low_self_esteem",
            "question_text_low_self_esteem")
        
        let concentrationQuestion = makeStep(QuestionIdentifier.TroubleConcentrating.rawValue,
            "question_title_trouble_concentrating",
            "question_text_trouble_concentrating")
        
        let slowFastQuestion = makeStep(QuestionIdentifier.SlowOrFast.rawValue,
            "question_title_slow_or_fast",
            "question_text_slow_or_fast")
        
        let suicideQuestion = makeStep(QuestionIdentifier.FeelingSuicidal.rawValue,
            "question_title_feeling_suicidal",
            "question_text_feeling_suicidal")
        
        return [
            pleasureInterestQuestion,
            depressedQuestion,
            sleepQuestion,
            tiredQuestion,
            appetiteQuestion,
            selfEsteemQuestion,
            concentrationQuestion,
            slowFastQuestion,
            suicideQuestion
        ]
    }

}
