

import Foundation


class License: Codable {
    
    var key : String?
    var name : String?
    var spdxId : String?
    var url : String?
    var nodeId : String?
    
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case spdxId = "spdx_id"
        case url = "url"
        case nodeId = "node_id"
    }

}



