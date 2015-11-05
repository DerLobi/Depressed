//
//  SelfTestTask.swift
//  Depressed?
//
//  Created by Christian Lobach on 27/10/15.
//  Copyright © 2015 Christian Lobach. All rights reserved.
//

import ResearchKit

class SelfTestTask: NSObject, ORKTask {

    let identifier = "SelfTest"
    

    func stepBeforeStep(step: ORKStep?, withResult result: ORKTaskResult) -> ORKStep? {
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

    func stepAfterStep(step: ORKStep?, withResult result: ORKTaskResult) -> ORKStep? {

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
    
    func progressOfCurrentStep(step: ORKStep, withResult result: ORKTaskResult) -> ORKTaskProgress {
        let index = steps().indexOf(step)
        
        if let index = index {
            return ORKTaskProgressMake(UInt(index), UInt(steps().count))
        }
        
        return ORKTaskProgressMake(0, UInt(steps().count))
    }
    
    func steps() -> [ORKStep] {

        let makeStep: (String, String, String) -> ORKQuestionStep = { identifier, title, text in
            let step = ORKQuestionStep(identifier: identifier, title: NSLocalizedString(title, comment: ""), answer: ORKTextChoiceAnswerFormat.phq9Format())
            step.text = text
            step.optional = false
            return step
        }
        
        let pleasureInterestQuestion = makeStep(QuestionIdentifier.LosingInterest.rawValue,
            "Little interest or pleasure in doing things",
            "Over the last 2 weeks, how often have you been bothered by having little interest or pleasure in doing things?")

        let depressedQuestion = makeStep(QuestionIdentifier.FeelingDepressed.rawValue,
            "Feeling down, depressed, or hopeless",
            "Over the last 2 weeks, how often have you been bothered by feeling down, depressed, or hopeless?")

        let sleepQuestion = makeStep(QuestionIdentifier.TroubleSleeping.rawValue,
            "Trouble falling asleep, or sleeping too much",
            "Over the last 2 weeks, how often have you been bothered by having trouble falling asleep, or sleeping too much?")
        
        let tiredQuestion = makeStep(QuestionIdentifier.FeelingTired.rawValue,
            "Feeling tired or having little energy",
            "Over the last 2 weeks, how often have you been bothered by feeling tired or having little energy?")

        let appetiteQuestion = makeStep(QuestionIdentifier.PoorAppetite.rawValue,
            "Poor appetite or overeating",
            "Over the last 2 weeks, how often have you been bothered by having poor appetite or overeating?")

        let selfEsteemQuestion = makeStep(QuestionIdentifier.LowSelfEsteem.rawValue,
            "Feeling bad about yourself",
            "Over the last 2 weeks, how often have you been bothered by feeling bad about yourself or that you are a failure or have let yourself or your family down?")
        
        let concentrationQuestion = makeStep(QuestionIdentifier.TroubleConcentrating.rawValue,
            "Trouble concentrating",
            "Over the last 2 weeks, how often have you been bothered by having trouble concentrating on things, such as reading the newspaper or watching television?")

        let slowFastQuestion = makeStep(QuestionIdentifier.SlowOrFast.rawValue,
            "Moving/speaking fast/slowly",
            "Over the last 2 weeks, how often have you been bothered by moving or speaking so slowly that other people could have noticed, or being so figety or restless that you have been moving around a lot more than usual?")

        let suicideQuestion = makeStep(QuestionIdentifier.FeelingSuicidal.rawValue,
            "Self-harm or suicidal thoughts",
            "Over the last 2 weeks, how often have you been bothered by thoughts that you would be better off dead, or of hurting yourself?")

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
