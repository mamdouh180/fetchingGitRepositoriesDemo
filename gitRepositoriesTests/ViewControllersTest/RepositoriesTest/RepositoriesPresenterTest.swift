
@testable import gitRepositories
import XCTest

class RepositoriesPresenterTest: XCTestCase {

    var repositoiesVC : RepositoriesViewController!
    var repositories = [Repositories]()
    
    override func setUp() {
        repositoiesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RepositoriesViewController") as? RepositoriesViewController
        _ = repositoiesVC.view
        repositories.append(Utls.generateRepositoryMoc())
    }
    
    override func tearDown() {
        
    }

    func testLoadOfflineData() {
        let repos = [Repositories]()
        let paging = Paging(itemsArray: repos)
        repositoiesVC.repositoriesPresenter.loadOfflineData()
        let repositoryIetmsCount = repositoiesVC.repositoriesPresenter.getRepositoriesCount()
        if repositoryIetmsCount > 0 {
            XCTAssertEqual(repositoryIetmsCount, paging.numberOfItemsPerPage)
        }
    }
    
    func testGetRepositoriesCount(){
        XCTAssertEqual(repositoiesVC.repositoriesPresenter.getRepositoriesCount(), 0)
    }
    
    func testConfigureRepositoriesTableViewCell(){
        
        let name = "name2", desc = "desciption2", language = "language2", licenseName = "license name2", updatedDate = "2019-05-14T10:14:07Z"
        let watchers = 6, forks = 7
        let archived = false
        
        repositoiesVC.repositoriesPresenter.repositories = repositories
        repositoiesVC.repositoriesTableView.reloadData()
        let cell = repositoiesVC.repositoriesTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! RepositoriesTableViewCell
        let repo = repositoiesVC.repositoriesPresenter.repositories[0]
        
        repo.name = name
        repo.description = desc
        repo.archived = archived
        repo.language = language
        repo.watchers = watchers
        repo.forks = forks
        repo.license?.name = licenseName
        repo.updatedAt = updatedDate

        repositoiesVC.repositoriesPresenter.configureRepositoriesTableViewCell(cell: cell, indexPath: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell.name.text, name)
        XCTAssertEqual(cell.repoDescription.text, desc)
        XCTAssertEqual(cell.archived.isHidden, !archived)
        XCTAssertEqual(cell.language.currentTitle, language)
        XCTAssertEqual(cell.license.currentTitle, licenseName)
        XCTAssertEqual(cell.watchers.currentTitle, String(watchers))
        XCTAssertEqual(cell.forks.currentTitle, String(forks))
    }


}
