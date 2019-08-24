
import Foundation
import Toast_Swift

extension RepositoriesViewController : ReposirtoriesViewDelegate{
    
    func changeActivityIndicatorVisibility(makeInvisible: Bool){
        loadingActivityIndicator.isHidden = makeInvisible
    }
    
    func stopRepositoriesRefreshControl(){
        self.repositoriesRefreshControl.endRefreshing()
    }
    
    func reloadRepositoriesTableView(){
        repositoriesTableView.reloadData()
    }
    
    func toast(text: String){
        view.makeToast(text)
    }
    
}
