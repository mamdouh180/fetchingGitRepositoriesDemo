

import XCTest
@testable import gitRepositories

class OwnerTest: XCTestCase {


    func testOwnerKeys() {
        var ownerKey = Owner.CodingKeys(rawValue: "login")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "id")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "node_id")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "avatar_url")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "gravatar_id")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "url")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "html_url")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "followers_url")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "following_url")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "gists_url")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "starred_url")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "subscriptions_url")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "organizations_url")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "repos_url")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "events_url")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "received_events_url")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "type")
        XCTAssertNotNil(ownerKey?.rawValue)
        ownerKey = Owner.CodingKeys(rawValue: "site_admin")
        XCTAssertNotNil(ownerKey?.rawValue)
        
        
    }

    

}
