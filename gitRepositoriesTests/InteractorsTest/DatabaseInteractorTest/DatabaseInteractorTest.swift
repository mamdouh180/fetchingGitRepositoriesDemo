
@testable import gitRepositories
import XCTest

class DatabaseInteractorTest: XCTestCase {

    func testSinglton_returnTrueForsingletonPattern(){
        let  databaseInteractor1 = DatabaseInteractor.shared
        let  databaseInteractor2 = DatabaseInteractor.shared
        XCTAssertEqual(databaseInteractor1, databaseInteractor2)

    }
    
    func testGetLocalData(){
        let repositories = DatabaseInteractor.shared.getRepositories()
        let repos = [Repositories]()
        let paging = Paging(itemsArray: repos)
        if repositories.count > 0 {
            XCTAssertEqual(repositories.count, paging.numberOfItemsPerPage)
        }
    }

}
