
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
    
    func setChild(x: String) {
        selectedChild = x
    }
}

