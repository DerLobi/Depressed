//
//  QuestionIdentifierSpec.swift
//  Depressed?
//
//  Created by Christian Lobach on 05/11/15.
//  Copyright © 2015 Christian Lobach. All rights reserved.
//
import Depressed
import Foundation
import Nimble
import Quick
import ResearchKit

class QuestionIdentifierSpec: QuickSpec {
    
    override func spec() {
        
        describe(".count") {
            
            it("is equal to 9") {
                expect(QuestionIdentifier.count).to(equal(9))
            }
            
        }
    }
}
 