//
//  TestModel.swift
//  PowerPlay
//
//  Created by Aadit Noronha on 7/20/23.
//

import Foundation
import CoreData

class TestModel {
    
    var myUser: User?
    var myChildren: [Child] = [] // Changed to an array to hold multiple Child objects
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load store: \(error)")
            }

            // Load or create the user object
            let userFetch = NSFetchRequest<User>(entityName: "User")
            do {
                let results = try self.container.viewContext.fetch(userFetch)
                self.myUser = results.first ?? User(context: self.container.viewContext)
            } catch {
                fatalError("Failed to fetch or create user: \(error)")
            }
            
            // Load existing children
            let childFetch = NSFetchRequest<Child>(entityName: "Child")
            do {
                let results = try self.container.viewContext.fetch(childFetch)
                self.myChildren = results
            } catch {
                fatalError("Failed to fetch children: \(error)")
            }
        }
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
        let userFetch = NSFetchRequest<User>(entityName: "User")
        
        do {
            let userResults = try container.viewContext.fetch(userFetch)
            myUser = userResults.first
        } catch {
            fatalError("Failed to fetch user: \(error)")
        }
        
        let childFetch = NSFetchRequest<Child>(entityName: "Child")
        do {
            let results = try container.viewContext.fetch(childFetch)
            myChildren = results
        } catch {
            fatalError("Failed to fetch children: \(error)")
        }
    }

    func delete() {
        if let userToDelete = myUser {
            container.viewContext.delete(userToDelete)
            myUser = nil
        }
        
        for childToDelete in myChildren {
            container.viewContext.delete(childToDelete)
        }
        myChildren.removeAll()
        
        save()
    }
}

class PV: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isParent: Bool = false
    @Published var childrenNames: [String] = [] // Separate array to hold child names
}
