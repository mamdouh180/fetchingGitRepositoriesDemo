
@testable import gitRepositories
import XCTest

class RepositoriesVC_PresenterDelegateTest: XCTestCase {

    var repositoiesVC : RepositoriesViewController!
    var repositories = [Repositories]()
    
    override func setUp() {
        repositoiesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RepositoriesViewController") as? RepositoriesViewController
        _ = repositoiesVC.view
        
        repositories.append(Utls.generateRepositoryMoc())
        
    }


    func testChangeActivityIndicatorVisibility() {
        repositoiesVC.loadingActivityIndicator.isHidden = true
        let visibilityStatus1 = repositoiesVC.loadingActivityIndicator.isHidden
        repositoiesVC.changeActivityIndicatorVisibility(makeInvisible: true)
        let visibilityStatus2 = repositoiesVC.loadingActivityIndicator.isHidden
        XCTAssertEqual(visibilityStatus1 ,visibilityStatus2)
    }
    
    func testStopRepositoriesRefreshControl(){
        repositoiesVC.repositoriesRefreshControl.beginRefreshing()
        repositoiesVC.stopRepositoriesRefreshControl()
        XCTAssertFalse(repositoiesVC.repositoriesRefreshControl.isRefreshing)
    }

    func testReloadRepositoriesTableView(){
        repositoiesVC.repositoriesPresenter.repositories = repositories
        repositoiesVC.reloadRepositoriesTableView()
        let cell = repositoiesVC.repositoriesTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! RepositoriesTableViewCell
        XCTAssertEqual(cell.name.text, "name")
    }
    

}
