

import UIKit
import RealmSwift

class RepositoriesViewController: UIViewController{
    
    @IBOutlet weak var repositoriesTableView: UITableView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    var repositoriesPresenter: RepositoriesPresenter!
    var repositoriesRefreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        repositoriesPresenter = RepositoriesPresenter(reposirtoriesDelegate: self)
        configurePullToRefresh()
        changeActivityIndicatorVisibility(makeInvisible: false)
        repositoriesPresenter.loadData()
    }
    
    //MARK:- pull to refresh
    func configurePullToRefresh(){
        repositoriesRefreshControl = UIRefreshControl()
        repositoriesRefreshControl.attributedTitle = NSAttributedString(string: "")
        repositoriesRefreshControl.addTarget(self, action: #selector(RepositoriesViewController.refreshRepositories(_:)), for: UIControl.Event.valueChanged)
        repositoriesTableView.addSubview(repositoriesRefreshControl)
    }
    
    @objc func refreshRepositories(_ sender:AnyObject){
        changeActivityIndicatorVisibility(makeInvisible: true)
        repositoriesPresenter.loadData()
    }

}
