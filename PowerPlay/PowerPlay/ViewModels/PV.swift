
import SwiftUI
import Foundation

class PV: ObservableObject {
    @Published var selectedChild: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isParent: Bool = false
    @Published var childrenNames: [String] = []
    @Published var badgesComplete: Set<String> = []
    @Published var selectedOptionIndex: Int = 0
    
    
    @Published var isLoggedOut: Bool = true
    
    func resetPV() {
        firstName = ""
        lastName = ""
        username = ""
        password = ""
        
    }

    
    func resetMaxPV() {
        firstName = ""
        lastName = ""
        username = ""
        password = ""
        isParent = false
        childrenNames = []
        badgesComplete = []
        selectedOptionIndex = 0
        isLoggedOut = true
        
    }
    
    func printAll() {
        print ("firstName: \(firstName)")
        print ("lastName: \(lastName)")
        print ("username: \(username)")
        print ("password: \(password)")
        print ("isParent: \(isParent)")
        print ("childrenNames: \(childrenNames)")
        print ("badgesComplete: \(badgesComplete)")
        print ("selectedOptionIndex: \(selectedOptionIndex)")
        print ("isLoggedOut: \(isLoggedOut)")
       
    }
    
    func setChild(x: String) {
        selectedChild = x
    }
}

