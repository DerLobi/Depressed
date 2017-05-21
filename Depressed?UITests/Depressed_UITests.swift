import XCTest

class Depressed_UITests: XCTestCase {
    
    override func setUp() {
        super.setUp()

        let app = XCUIApplication()
        
        setupSnapshot(app)
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
        var viewDetailsButton: XCUIElement!
        
        if deviceLanguage == "de" {
            startButton = app.buttons["Test starten"]
            viewDetailsButton = app.buttons["Details anzeigen >"]
            nearlyEveryDayCell = app.tables.staticTexts["Beinahe jeden Tag"]
            severalDaysCell = app.tables.staticTexts["An einzelnen Tagen"]
            moreThanHalfTheDaysCell = app.tables.staticTexts["An mehr als der Hälfte der Tage"]
            notAtAllCell = app.tables.staticTexts["Überhaupt nicht"]
        } else if deviceLanguage == "fr" {
            startButton = app.buttons["Démarrer le Test"]
            viewDetailsButton = app.buttons["Voir les Details >"]
            nearlyEveryDayCell = app.tables.staticTexts["Quasiment tous les jours"]
            severalDaysCell = app.tables.staticTexts["Parfois"]
            moreThanHalfTheDaysCell = app.tables.staticTexts["Régulièrement, au moins un jour sur deux"]
            notAtAllCell = app.tables.staticTexts["Jamais"]
        } else {
            startButton = app.buttons["Start the Test"]
            viewDetailsButton = app.buttons["View Details >"]
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
        nearlyEveryDayCell.tap()

        sleep(1)
        moreThanHalfTheDaysCell.tap()

        sleep(1)
        nearlyEveryDayCell.tap()

        sleep(1)
        moreThanHalfTheDaysCell.tap()

        sleep(1)
        moreThanHalfTheDaysCell.tap()

        sleep(1)
        severalDaysCell.tap()
        
        sleep(1)
        notAtAllCell.tap()

        sleep(1)
        notAtAllCell.tap()
                
        snapshot("03Result")

        sleep(1)
        viewDetailsButton.tap()
        snapshot("04ResultDetails")
        
        sleep(1)
        app.tables.element.swipeUp()
        app.tables.element.swipeUp()
        snapshot("05ResultDetailsBottom")
    }
    
    
}
