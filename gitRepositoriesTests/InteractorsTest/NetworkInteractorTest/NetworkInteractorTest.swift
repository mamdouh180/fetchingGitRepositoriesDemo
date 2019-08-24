
@testable import gitRepositories
import XCTest

class NetworkInteractorTest: XCTestCase {
    
    var mockSession:DHURLSession = URLSession(configuration: .default)
    let url = URL(string: "https://api.github.com")
    
    override func setUp() {
        super.setUp()
        
        // Setup mock
        let path = Bundle.main.path(forResource: "RepositoriesSample", ofType: "plist")
        let dataArray = NSArray(contentsOfFile: path!) //NSDictionary(contentsOfFile: path!)
        let json = try! JSONSerialization.data(withJSONObject: dataArray!, options: .init(rawValue: 0))
        let urlResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        mockSession = URLSessionMock(data: json, response: urlResponse, error: nil)
    }

    func testTotalPages(){
        let headerLink = "<https://api.github.com/user/66577/repos?page=1&per_page=15>; rel=\"prev\", <https://api.github.com/user/66577/repos?page=3&per_page=15>; rel=\"next\", <https://api.github.com/user/66577/repos?page=8&per_page=15>; rel=\"last\", <https://api.github.com/user/66577/repos?page=1&per_page=15>; rel=\"first\""
        XCTAssertEqual(NetworkInteractor.getTotalPages(headerLink), 8)
    }
    
    func testFetchingData() {
        let promise = expectation(description: "MockSession")
        let task = mockSession.dataTask(with: url!) { (data, response, error) in
            //
            if (response as! HTTPURLResponse).statusCode == 200 {
                
                if let model = try? JSONDecoder().decode(RepositoriesResponse.self, from: data!){
                    promise.fulfill()
                    XCTAssertEqual(model.repositories.count, 15)
                    XCTAssertEqual(model.repositories[0].name, "ActionBarSherlock")
                }
            } else {
                XCTAssert(false, "Status code not 200")
                promise.fulfill()
            }
            
        }
        
        task.resume()
        waitForExpectations(timeout: 5.0, handler: nil)
    }

}
