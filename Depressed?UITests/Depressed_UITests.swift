import XCTest

class Depressed_UITests: XCTestCase {
    
    override func setUp() {
        super.setUp()

        let app = XCUIApplication()
        setLanguage(app)
        app.launch()
        
    }
    
    func testScreenshots() {

        let app = XCUIApplication()
        snapshot("01Start")
        
        var startButton: XCUIElement!
        var nearlyEveryDayCell: XCUIElement!
        var severalDaysCell: XCUIElement!
        var moreThanHalfTheDaysCell: XCUIElement!
        var notAtAllCell: XCUIElement!
        
        if deviceLanguage == "de" {
            startButton = app.buttons["Test starten"]
            nearlyEveryDayCell = app.tables.staticTexts["Beinahe jeden Tag"]
            severalDaysCell = app.tables.staticTexts["An einzelnen Tagen"]
            moreThanHalfTheDaysCell = app.tables.staticTexts["An mehr als der Hälfte der Tage"]
            notAtAllCell = app.tables.staticTexts["Überhaupt nicht"]
        } else {
            startButton = app.buttons["Start the Test"]
            nearlyEveryDayCell = app.tables.staticTexts["Nearly every day"]
            severalDaysCell = app.tables.staticTexts["Several days"]
            moreThanHalfTheDaysCell = app.tables.staticTexts["More than half the days"]
            notAtAllCell = app.tables.staticTexts["Not at all"]
        }
        
        startButton?.tap()

        sleep(1)
        snapshot("02FirstQuestion")

        nearlyEveryDayCell.tap()

        sleep(1)
        severalDaysCell.tap()

        sleep(1)
        moreThanHalfTheDaysCell.tap()

        sleep(1)
        severalDaysCell.tap()

        sleep(1)
        moreThanHalfTheDaysCell.tap()

        sleep(1)
        moreThanHalfTheDaysCell.tap()

        sleep(1)
        severalDaysCell.tap()
        
        sleep(1)
        notAtAllCell.tap()

        sleep(1)
        snapshot("03LastQuestion")
        notAtAllCell.tap()
                
        snapshot("04Result")
    }
    
}
