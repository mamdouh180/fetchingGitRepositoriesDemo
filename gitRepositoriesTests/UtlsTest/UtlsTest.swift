
@testable import gitRepositories
import XCTest

class UtlsTest: XCTestCase {
    func testRegularExpression(){
        let text = "abc187def$def<,def99def"
        let result = Utls.getTextWithRegularExpression(regex: "[a-z]+9", text: text)
        XCTAssertEqual(result[0], "def9")
    }
    
    func testDateFromStringFormatted(){
        let originalDate = Date()
        let dateString =  Utls.getDateString(date: originalDate)
        if let convertedDate = Utls.getDate(dateString: dateString){
            let originalDateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: originalDate)
            let oconvertedDateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: convertedDate)
            XCTAssertEqual(originalDateComponents.day, oconvertedDateComponents.day)
            XCTAssertEqual(originalDateComponents.month, oconvertedDateComponents.month)
            XCTAssertEqual(originalDateComponents.year, oconvertedDateComponents.year)
            XCTAssertEqual(originalDateComponents.hour, oconvertedDateComponents.hour)
            XCTAssertEqual(originalDateComponents.minute, oconvertedDateComponents.minute)
            XCTAssertEqual(originalDateComponents.second, oconvertedDateComponents.second)
        }
    }
}
