

import Foundation
import UIKit

protocol ReposirtoriesViewDelegate: class {
    func changeActivityIndicatorVisibility(makeInvisible: Bool)
    func stopRepositoriesRefreshControl()
    func reloadRepositoriesTableView()
    func toast(text: String)
}

class RepositoriesPresenter {
    
    private weak var reposirtoriesDelegate: ReposirtoriesViewDelegate?
    private var paging: Paging!
    var repositories = [Repositories] ()
    
    init(reposirtoriesDelegate : ReposirtoriesViewDelegate) {
        self.reposirtoriesDelegate = reposirtoriesDelegate
        paging = Paging(itemsArray: repositories)
    }
    
    //MARK:- Offline data
    func loadOfflineData(){
        repositories = DatabaseInteractor.shared.getRepositories()
        reposirtoriesDelegate?.reloadRepositoriesTableView()
    }
    
    //MARK:- Networking
    func loadData(){
        if !Utls.isConnectedToNetwork(){
            reposirtoriesDelegate?.toast(text: NSLocalizedString("internet_connection_error", comment: "") )
            reposirtoriesDelegate?.changeActivityIndicatorVisibility(makeInvisible: true)
            reposirtoriesDelegate?.stopRepositoriesRefreshControl()
            loadOfflineData()
            return
        }
        if (!paging.isLaoding()){
            paging.resetPaging()
            paging.changeLoadingStatus()
            getRepositories(page: paging.getCurrentPage()+1)
        }
    }
    
    func loadMoreData(){
        if (!paging.isLaoding() && paging.shoudLoadMoreData()){
            paging.changeLoadingStatus()
            getRepositories(page: paging.getCurrentPage()+1)
        }
    }
    
    func getRepositoriesCount() -> Int{
        return repositories.count
    }
    
    func getRepositories(page: Int){
        if !Utls.isConnectedToNetwork(){
            reposirtoriesDelegate?.toast(text: NSLocalizedString("internet_connection_error", comment: "") )
            paging.changeLoadingStatus()
            reposirtoriesDelegate?.changeActivityIndicatorVisibility(makeInvisible: true)
            reposirtoriesDelegate?.stopRepositoriesRefreshControl()
            return
        }
        NetworkInteractor.getRepositories(page: page, itemsPerPage: paging.numberOfItemsPerPage) { (response) in
            self.paging.changeLoadingStatus()
            self.reposirtoriesDelegate?.changeActivityIndicatorVisibility(makeInvisible: true)
            self.reposirtoriesDelegate?.stopRepositoriesRefreshControl()
            if response.success{
                if (self.paging.getCurrentPage()==0){
                    self.repositories.removeAll()
                    self.repositories = response.repositories
                        DispatchQueue.global(qos: .default).async {
                            DatabaseInteractor.shared.insertRepositories(repositories: self.repositories)
                        }
                    
                }else{
                    for item in response.repositories{
                        self.repositories.append(item)
                    }
                }
                self.paging.increasePageNumber()
                self.paging.setTotalItems(totalPages: response.totalPages ?? 0)
                self.reposirtoriesDelegate?.reloadRepositoriesTableView()
            }else{
                print(response.error!)
            }
        }
    }
    
    //MARK:- TableView functions
    func configureRepositoriesTableViewCell(cell: RepositoriesTableViewCell, indexPath: IndexPath){
        

        cell.setName(cell: cell, text: repositories[indexPath.row].name ?? "")
        
        let archived = repositories[indexPath.row].archived ?? false
        cell.changeArchivingVisibility(cell: cell, makeInvisible: !archived)
        
        cell.setDescription(cell: cell, text: repositories[indexPath.row].description ?? "")

        cell.setLanguage(cell: cell, text: repositories[indexPath.row].language ?? "")


        cell.setForks(cell: cell, text: String(repositories[indexPath.row].forks ?? 0))
        

        if let license = repositories[indexPath.row].license{
            cell.setLicense(cell: cell, text: license.name ?? "")
            cell.changeLicenseVisibility(cell: cell, makeInvisible: false)
        }else{
            cell.changeLicenseVisibility(cell: cell, makeInvisible: true)
        }
        
        cell.setWatchers(cell: cell, text: String(repositories[indexPath.row].watchers ?? 0))
        
        cell.setUpdatingDate(cell: cell, text: repositories[indexPath.row].updatedAt ?? "")
        
        
        if indexPath.row == repositories.count-4{
            if !paging.isLaoding() && paging.shoudLoadMoreData(){
                loadMoreData()
            }
        }
        
        if indexPath.row == repositories.count-1 && paging.isLaoding(){
            cell.changeLoadingMoreActivityIndicatorVisibility(cell: cell, makeInvisible: false)
        }else{
            cell.changeLoadingMoreActivityIndicatorVisibility(cell: cell, makeInvisible: true)
        }
        
        
    }
    
}
