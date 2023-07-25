import Foundation
import CoreData
import SwiftUI

class TestModel: ObservableObject {
    static let shared = TestModel()
    var myUsers: [User] = []
    var myChildren: [Child] = []
    @Published var myParks: [Park] = []

    let container: NSPersistentContainer = NSPersistentContainer(name: "Model")

    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load store: \(error)")
            }

            self.loadUsers()
            self.loadChildren()
            self.loadParks()
        }
    }

    func createUser() -> User {
        let newUser = User(context: container.viewContext)
        myUsers.append(newUser)
        return newUser
    }

    func getUsers() -> [User] {
        return myUsers
    }

    func createPark() -> Park {
        let newPark = Park(context: container.viewContext)
        myParks.append(newPark)
        return newPark
    }

    func getParks() -> [Park] {
        return myParks
    }

    func createChild() -> Child {
        let newChild = Child(context: container.viewContext)
        myChildren.append(newChild)
        return newChild
    }

    func save() {
        do {
            try container.viewContext.save()
        } catch {
            fatalError("Failed to save context: \(error)")
        }
    }

    func load() {
        loadUsers()
        loadChildren()
        loadParks()
    }
    func addToBadges(name: String) {
        myParks.last?.badges?.append(name)
    }

    func deleteAllEntitiesData() {
        let childFetchRequest: NSFetchRequest<NSFetchRequestResult> = Child.fetchRequest()
        let deleteChildRequest = NSBatchDeleteRequest(fetchRequest: childFetchRequest)

        let userFetchRequest: NSFetchRequest<NSFetchRequestResult> = User.fetchRequest()
        let deleteUserRequest = NSBatchDeleteRequest(fetchRequest: userFetchRequest)

        let parkFetchRequest: NSFetchRequest<NSFetchRequestResult> = Park.fetchRequest()
        let deleteParkRequest = NSBatchDeleteRequest(fetchRequest: parkFetchRequest)

        do {
            try container.viewContext.execute(deleteChildRequest)
            try container.viewContext.execute(deleteUserRequest)
            try container.viewContext.execute(deleteParkRequest)

            try container.viewContext.save()
        } catch {
            print("Error deleting all entities data: \(error)")
        }
    }

    private func loadUsers() {
        let userFetch = NSFetchRequest<User>(entityName: "User")
        do {
            let results = try self.container.viewContext.fetch(userFetch)
            myUsers = results
        } catch {
            fatalError("Failed to fetch or create user: \(error)")
        }
    }

    private func loadParks() {
        let parkFetch = NSFetchRequest<Park>(entityName: "Park")
        do {
            let results = try self.container.viewContext.fetch(parkFetch)
            myParks = results
        } catch {
            fatalError("Failed to fetch or create parks: \(error)")
        }
    }

    private func loadChildren() {
        let childFetch = NSFetchRequest<Child>(entityName: "Child")
        do {
            let results = try self.container.viewContext.fetch(childFetch)
            myChildren = results
        } catch {
            fatalError("Failed to fetch children: \(error)")
        }
    }

}
