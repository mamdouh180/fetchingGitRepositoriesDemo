

import Foundation

private struct DummyCodable: Codable {}

class RepositoriesResponse: Codable
{
    
    var success:Bool!
    var error:String?
    var totalPages:Int?
    
    var repositories = [Repositories] ()
    
    init() {
    }
    
    required init(from decoder: Decoder) throws {
        //var repos = [Repositories]()
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            if let repository = try? container.decode(Repositories.self) {
                //repos.append(repository)
                repositories.append(repository)
            } else {
                _ = try? container.decode(DummyCodable.self) // <-- TRICK
            }
        }
        //self.repositories = repos
    }
    
    
    
}
