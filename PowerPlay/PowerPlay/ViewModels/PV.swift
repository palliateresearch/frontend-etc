
import SwiftUI
import Foundation

class PV: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isParent: Bool = false
    @Published var childrenNames: [String] = []
    @Published var badgesComplete: Set<String> = []
}

