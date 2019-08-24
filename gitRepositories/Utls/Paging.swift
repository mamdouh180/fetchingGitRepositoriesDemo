
import Foundation

class Paging {
    
    var itemsArray: [Any]
    public let numberOfItemsPerPage = 15
    private var totalItems = 0
    private var currentPage = 0
    private var isLoading = false
    
    init(itemsArray: [Any]) {
        self.itemsArray = itemsArray
    }
    
    func getTotalItems() -> Int{
        return totalItems
    }
    
    func setTotalItems(totalPages: Int){
        totalItems = totalPages * numberOfItemsPerPage
    }
    
    func shoudLoadMoreData() -> Bool{
        return getTotalItems() > itemsArray.count
    }
    
    func getCurrentPage() -> Int{
        return currentPage
    }
    
    func increasePageNumber(){
        currentPage += 1
    }
    
    func changeLoadingStatus(){
        isLoading = !isLoading
    }
    
    func isLaoding() -> Bool{
        return isLoading
    }
    
    func resetPaging(){
        totalItems = 0
        currentPage = 0
    }
    
}
