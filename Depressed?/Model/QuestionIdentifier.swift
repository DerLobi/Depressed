//
//  QuestionIdentifier.swift
//  Depressed?
//
//  Created by Christian Lobach on 28/10/15.
//  Copyright © 2015 Christian Lobach. All rights reserved.
//

public enum QuestionIdentifier: String {
    case LosingInterest
    case FeelingDepressed
    case TroubleSleeping
    case FeelingTired
    case PoorAppetite
    case LowSelfEsteem
    case TroubleConcentrating
    case SlowOrFast
    case FeelingSuicidal
    
    public static let count: Int = [
        LosingInterest,
        FeelingDepressed,
        TroubleSleeping,
        FeelingTired,
        PoorAppetite,
        LowSelfEsteem,
        TroubleConcentrating,
        SlowOrFast,
        FeelingSuicidal
        ].count
    
}
