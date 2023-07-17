import SwiftUI

class UserData: ObservableObject {
    var userID: String = ""
    var username: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var lifetimeWattage: Int = 0
    var wattagePerDay: [Int] = []
    var parkID: String = ""
    var isParent: Bool = false
    var children: [String] = []
    var userNumber: String = ""
    var password: String = ""
    var badgesComplete: [String] = []
    var badgesInProgress: [String] = []
    var badgesDone: [String] = []
    var rfid: String = ""
} 
