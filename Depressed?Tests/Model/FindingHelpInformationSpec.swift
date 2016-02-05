import Depressed
import Foundation
import Nimble
import Quick
import ResearchKit

class FindingHelpInformationSpec: QuickSpec {
    
    override func spec() {
        
        var info: FindingHelpInformation?
        
        describe("-init?(locale:)") {

            context("locale is fr_FR") {
                
                beforeEach {
                    let locale = NSLocale(localeIdentifier: "fr-FR")
                    info = FindingHelpInformation(locale: locale)
                }
                
                it("fails") {
                    expect(info).to(beNil())
                }
            }

            context("locale is de_AT") {
                
                beforeEach {
                    let locale = NSLocale(localeIdentifier: "de-AT")
                    info = FindingHelpInformation(locale: locale)
                }
                
                it("fails") {
                    expect(info).to(beNil())
                }
            }

            context("locale is de_CH") {
                
                beforeEach {
                    let locale = NSLocale(localeIdentifier: "de-CH")
                    info = FindingHelpInformation(locale: locale)
                }
                
                it("fails") {
                    expect(info).to(beNil())
                }
            }

        }
        
        describe(".url") {
            
            sharedExamples("returns the correct URL for the locale") { (context: SharedExampleContext) in
                
                let localeIdentifier = context()["locale"]! as! String
                let expectedURL = NSURL(string: (context()["url"] as! String))
                
                beforeEach {
                    let locale = NSLocale(localeIdentifier: localeIdentifier)
                    info = FindingHelpInformation(locale: locale)
                }
                
                it("returns the correct URL") {
                    expect(info!.url).to(equal(expectedURL))
                }
            }
            
            itBehavesLike("returns the correct URL for the locale") {
                return [
                    "locale": "en_US",
                    "url": "http://www.adaa.org/finding-help"
                ]
            }

            itBehavesLike("returns the correct URL for the locale") {
                return [
                    "locale": "es_US",
                    "url": "http://www.adaa.org/finding-help"
                ]
            }
            
            itBehavesLike("returns the correct URL for the locale") {
                return [
                    "locale": "de_DE",
                    "url": "http://www.deutsche-depressionshilfe.de/stiftung/erste-hilfe.php"
                ]
            }

            itBehavesLike("returns the correct URL for the locale") {
                return [
                    "locale": "en_DE",
                    "url": "http://www.deutsche-depressionshilfe.de/stiftung/erste-hilfe.php"
                ]
            }
        }
        
        describe(".organizationName") {
            
            sharedExamples("returns the correct organization name for the locale") { (context: SharedExampleContext) in
                
                let localeIdentifier = context()["locale"]! as! String
                let organizationName = context()["name"] as! String
                
                beforeEach {
                    let locale = NSLocale(localeIdentifier: localeIdentifier)
                    info = FindingHelpInformation(locale: locale)
                }
                
                it("returns the correct organization name") {
                    expect(info!.organizationName).to(equal(organizationName))
                }
            }
            
            itBehavesLike("returns the correct organization name for the locale") {
                return [
                    "locale": "en_US",
                    "name": "Anxiety and Depression Association of America (ADAA) / www.adaa.org"
                ]
            }
            
            itBehavesLike("returns the correct organization name for the locale") {
                return [
                    "locale": "es_US",
                    "name": "Anxiety and Depression Association of America (ADAA) / www.adaa.org"
                ]
            }
            
            itBehavesLike("returns the correct organization name for the locale") {
                return [
                    "locale": "de_DE",
                    "name": "Stiftung Deutsche Depressionshilfe"
                ]
            }
            
            itBehavesLike("returns the correct organization name for the locale") {
                return [
                    "locale": "en_DE",
                    "name": "Stiftung Deutsche Depressionshilfe"
                ]
            }             
        }
    }
}
