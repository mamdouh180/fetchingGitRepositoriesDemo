
import XCTest
@testable import gitRepositories
class PagingTest: XCTestCase {

    var paging: Paging!
    var repos = [Repositories]()
    
    override func setUp() {
        paging = Paging(itemsArray: repos)
    }

    

    func testGetTotalItems() {
        XCTAssertEqual(paging.getTotalItems(), 0)
    }

    func testSetTotalItems(){
        let numberOfPages = 2
        paging.setTotalItems(totalPages: numberOfPages)
        XCTAssertEqual(paging.getTotalItems(), numberOfPages * paging.numberOfItemsPerPage)
    }
    
    func testShoudLoadingMoreData(){
        if paging.isLaoding(){
            XCTAssertFalse(paging.shoudLoadMoreData())
        }
    }
    
    func testGetCurrentPage(){
        let currentPage = paging.getCurrentPage()
        paging.increasePageNumber()
        XCTAssertEqual(currentPage , paging.getCurrentPage() - 1)
    }
    
    func testIncreasePageNumber(){
        let currentPageNumber = paging.getCurrentPage()
        paging.increasePageNumber()
        XCTAssertEqual(paging.getCurrentPage()  , currentPageNumber + 1)
    }
    
    func testCheckChangeLoadingStatusAndIsLoadin(){
        let initialLoadingStatus = paging.isLaoding()
        paging.changeLoadingStatus()
        let finalLoadingStatus = paging.isLaoding()
        XCTAssertEqual(initialLoadingStatus, !finalLoadingStatus)
    }
    
    func testResetPaging(){
        paging.resetPaging()
        XCTAssertEqual(paging.getTotalItems(), 0)
        XCTAssertEqual(paging.getCurrentPage(), 0)
    }

}
