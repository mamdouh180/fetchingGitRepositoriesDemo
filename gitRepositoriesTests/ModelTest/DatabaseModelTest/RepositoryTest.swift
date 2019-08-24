
@testable import gitRepositories
import XCTest

class RepositoryTest: XCTestCase {

    
    func testExample() {
        let repository = Repository()
        XCTAssertEqual(repository.id, 0)
        XCTAssertEqual(repository.name, "")
        XCTAssertEqual(repository.repoDescription, "")
        XCTAssertEqual(repository.archived, false)
        XCTAssertEqual(repository.language, "")
        XCTAssertEqual(repository.watchers, 0)
        XCTAssertEqual(repository.forks, 0)
        XCTAssertEqual(repository.license, "")
        XCTAssertEqual(repository.updateDate, "")
        
    }

}
