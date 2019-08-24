
@testable import gitRepositories
import XCTest

class RepositoriesTableViewCellTest: XCTestCase {

    var repositoiesVC : RepositoriesViewController!
    var repositories = [Repositories]()
    var textText = "150"
    
    override func setUp() {
        repositoiesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RepositoriesViewController") as? RepositoriesViewController
        _ = repositoiesVC.view
        
        repositories.append(Utls.generateRepositoryMoc())
    }

    override func tearDown() {
        
    }
    
    func testSetName(){
        let cell = loadFirstCell()
        cell.setName(cell: cell, text: "test")
        XCTAssertEqual(cell.name.text, "test")
    }
    
    func testSetDescription(){
        let cell = loadFirstCell()
        cell.setDescription(cell: cell, text: textText)
        XCTAssertEqual(cell.repoDescription.text, textText)
    }
    
    func testSetSetLanguage(){
        let cell = loadFirstCell()
        cell.setLanguage(cell: cell, text: textText)
        XCTAssertEqual(cell.language.currentTitle, textText)
    }
    
    func testSetWatchers(){
        let cell = loadFirstCell()
        cell.setWatchers(cell: cell, text: textText)
        XCTAssertEqual(cell.watchers.currentTitle, textText)
    }
    
    func testSetForks(){
        let cell = loadFirstCell()
        cell.setForks(cell: cell, text: textText)
        XCTAssertEqual(cell.forks.currentTitle, textText)
    }
    
    func testSetLicense(){
        let cell = loadFirstCell()
        cell.setLicense(cell: cell, text: textText)
        XCTAssertEqual(cell.license.currentTitle, textText)
    }
    
    func testSetUpdatingDate(){

        let date = Calendar.current.date(byAdding: .month, value: 1, to: Date())
        let dateString = Utls.getDateString(date: date!)
        
        let cell = loadFirstCell()
        
        cell.setUpdatingDate(cell: cell, text: dateString)
        XCTAssertEqual(cell.updatingDate.text, "\(NSLocalizedString("update_first_word", comment: "")) 1 \(NSLocalizedString("update_month", comment: "")) \(NSLocalizedString("update_last_word", comment: ""))" )
    }
    
    func testChangeArchivingVisibility(){
        let cell = loadFirstCell()
        cell.archived.isHidden = true
        let visibilityStatus1 = cell.archived.isHidden
        cell.changeArchivingVisibility(cell: cell, makeInvisible: true)
        let visibilityStatus2 = cell.archived.isHidden
        XCTAssertEqual(visibilityStatus1 ,visibilityStatus2)
    }
    
    func testChangeLicenseVisibility(){
        let cell = loadFirstCell()
        cell.license.isHidden = true
        let visibilityStatus1 = cell.license.isHidden
        cell.changeArchivingVisibility(cell: cell, makeInvisible: true)
        let visibilityStatus2 = cell.license.isHidden
        XCTAssertEqual(visibilityStatus1 ,visibilityStatus2)
    }
    
    func testChangeLoadingMoreActivityIndicatorVisibility(){
        let cell = loadFirstCell()
        let visibilityStatus1 = cell.loadingMoreActivityIndicator.isHidden
        cell.changeArchivingVisibility(cell: cell, makeInvisible: true)
        let visibilityStatus2 = cell.loadingMoreActivityIndicator.isHidden
        XCTAssertEqual(visibilityStatus1 ,visibilityStatus2)
    }
    
    func loadFirstCell() -> RepositoriesTableViewCell{
        repositoiesVC.repositoriesPresenter.repositories = repositories
        repositoiesVC.reloadRepositoriesTableView()
        let cell = repositoiesVC.repositoriesTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! RepositoriesTableViewCell
        cell.loadingMoreActivityIndicator.isHidden = true
        return cell
    }
    


}
