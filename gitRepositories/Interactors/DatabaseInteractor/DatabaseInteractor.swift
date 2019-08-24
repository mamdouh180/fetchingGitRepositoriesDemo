

import Foundation
import RealmSwift

class DatabaseInteractor: NSObject{
    static let shared = DatabaseInteractor()
    
    func insertRepositories(repositories : [Repositories]){
        
        deleteAllRepositories()
        
        let realm = try! Realm()
        for item in repositories{
            let repository = Repository()
            repository.id = item.id ?? 0
            repository.name = item.name ?? ""
            repository.repoDescription = item.description ?? ""
            repository.archived = item.archived ?? false
            repository.language = item.language ?? ""
            repository.watchers = item.watchers ?? 0
            repository.forks = item.forks ?? 0
            repository.license = item.license?.name ?? ""
            repository.updateDate = item.updatedAt ?? ""

            try! realm.write {
                realm.add(repository)
            }
        }
    }
    
    func deleteAllRepositories(){
        let realm = try! Realm()
        let repositories = realm.objects(Repository.self)
        for item in repositories{
            try! realm.write {
                realm.delete(item)
            }
        }
    }
    
    func getRepositories() -> [Repositories] {
        let realm = try! Realm()
        let repos = realm.objects(Repository.self)
        var repositories = [Repositories]()
        
        for item in repos{
            let repository = Repositories()
            repository.id = item.id
            repository.name = item.name
            repository.description = item.repoDescription
            repository.archived = item.archived
            repository.language = item.language
            repository.watchers = item.watchers
            repository.forks = item.forks
            let licenceObject = License()
            if item.license == "" {
                repository.license = nil
            }else{
                licenceObject.name = item.license
                repository.license = licenceObject
            }
            repository.updatedAt = item.updateDate
            repositories.append(repository)
        }

        return repositories
    }
    
    
}
