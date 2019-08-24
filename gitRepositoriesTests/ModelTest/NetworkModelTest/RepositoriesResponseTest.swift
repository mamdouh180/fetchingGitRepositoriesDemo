
@testable import gitRepositories
import XCTest

class RepositoriesResponseTest: XCTestCase {

    func testInit(){
        let repository = Repositories()
        let owner = Owner()
        let license = License()
        repository.id = 10
        owner.login = "Mark"
        license.name = "Apache License 2.0"
        repository.owner = owner
        repository.license = license
        let jsonSample = "[{ \"id\": 10, \"owner\": {\"login\": \"Mark\"},\"license\": {\"name\": \"Apache License 2.0\"}}]"
        let data = jsonSample.data(using: .utf8)!
        
        if let model = try? JSONDecoder().decode(RepositoriesResponse.self, from: data){
            XCTAssertEqual(model.repositories[0].id, repository.id)
            XCTAssertEqual(model.repositories[0].owner?.login, repository.owner?.login)
            XCTAssertEqual(model.repositories[0].license?.name, repository.license?.name)
        }
    }
    

}
