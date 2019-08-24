

import Foundation
import Alamofire

class NetworkInteractor {
    
    
    static let jackeWhartonUrl = "https://api.github.com/users/JakeWharton/repos"
    
    
    static func getRepositories(page: Int, itemsPerPage: Int, _ completion: @escaping (_ result: RepositoriesResponse) -> Void){
        
        let url = jackeWhartonUrl+"?page=\(page)&per_page=\(itemsPerPage)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                
                switch response.result {
                case .success:
                    if let data = response.data{
                            if let model = try? JSONDecoder().decode(RepositoriesResponse.self, from: data){
                                if let _ = response.response?.statusCode{
                                    model.totalPages =  getTotalPages(response.response?.allHeaderFields["Link"] as! String)
                                    model.success = true;
                                    completion(model)
                                }else{
                                    let emptyModel = RepositoriesResponse()
                                    emptyModel.success = false
                                    emptyModel.error = response.result.error!.localizedDescription
                                    completion(emptyModel);
                                }
                            }
                    }
                case .failure:
                    let emptyModel = RepositoriesResponse()
                    emptyModel.success = false
                    emptyModel.error = response.result.error!.localizedDescription
                    completion(emptyModel);
                }
        }
    }
    
    static func getTotalPages(_ link: String) -> Int{
        let lastPagePattern = "page=[0-9]+&per_page=[0-9]+>; rel=\"last\""
        let countPattern = "[0-9]+"
        let lastPageSubtextArray = Utls.getTextWithRegularExpression(regex: lastPagePattern, text: link)
        if (lastPageSubtextArray.count == 1){
            let pagesCoutSringArray = Utls.getTextWithRegularExpression(regex: countPattern, text: lastPageSubtextArray[0])
            let count = pagesCoutSringArray.count > 0 ? Int(pagesCoutSringArray[0])! : 0
            return count
        }
        return 0
    }
    
}
