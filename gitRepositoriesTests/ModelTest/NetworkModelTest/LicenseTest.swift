

import XCTest
@testable import gitRepositories

class LicenseTest: XCTestCase {


    func testLicenseKeys() {
        var licenseKey = License.CodingKeys(rawValue: "key")
        XCTAssertNotNil(licenseKey?.rawValue)
        licenseKey = License.CodingKeys(rawValue: "name")
        XCTAssertNotNil(licenseKey?.rawValue)
        licenseKey = License.CodingKeys(rawValue: "spdx_id")
        XCTAssertNotNil(licenseKey?.rawValue)
        licenseKey = License.CodingKeys(rawValue: "url")
        XCTAssertNotNil(licenseKey?.rawValue)
        licenseKey = License.CodingKeys(rawValue: "node_id")
        XCTAssertNotNil(licenseKey?.rawValue)
    }
    
    

}
