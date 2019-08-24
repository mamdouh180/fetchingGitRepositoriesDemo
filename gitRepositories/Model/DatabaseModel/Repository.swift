
import RealmSwift
import Foundation

class Repository: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var repoDescription: String = ""
    @objc dynamic var archived: Bool = false
    @objc dynamic var language: String = ""
    @objc dynamic var watchers: Int = 0
    @objc dynamic var forks: Int = 0
    @objc dynamic var license: String = ""
    @objc dynamic var updateDate: String = ""
}
