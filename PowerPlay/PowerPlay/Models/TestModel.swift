//
//  TestModel.swift
//  PowerPlay
//
//  Created by Aadit Noronha on 7/20/23.
//

import Foundation
import CoreData
import SwiftUI

class TestModel {
    
    var myUser: User?
    var myChildren: [Child] = [] // Changed to an array to hold multiple Child objects
    var myPark: Park?
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load store: \(error)")
            }
            
            let userFetch = NSFetchRequest<User>(entityName: "User")
            do {
                let results = try self.container.viewContext.fetch(userFetch)
                self.myUser = results.first ?? User(context: self.container.viewContext)
            } catch {
                fatalError("Failed to fetch or create user: \(error)")
            }
            
            let parkFetch = NSFetchRequest<Park>(entityName: "Park")
            do {
                let results = try self.container.viewContext.fetch(parkFetch)
                self.myPark = results.first ?? Park(context: self.container.viewContext)
            } catch {
                fatalError("Failed to fetch or create park: \(error)")
            }
            
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
        let parkFetch = NSFetchRequest<Park>(entityName: "Park")
        do {
            let results = try container.viewContext.fetch(parkFetch)
            myPark = results.first
            print (results.first)
            print ("\n\n\n\n\n\n")
        } catch {
            fatalError("Failed to fetch park: \(error)")
        }
    }
    
    func delete() {
        if let userToDelete = myUser {
            container.viewContext.delete(userToDelete)
            myUser = nil
        }
        if let parkToDelete = myPark {
            container.viewContext.delete(parkToDelete)
            myPark = nil
        }
        
        for childToDelete in myChildren {
            container.viewContext.delete(childToDelete)
        }
        myChildren.removeAll()
        
        save()
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
    
}
