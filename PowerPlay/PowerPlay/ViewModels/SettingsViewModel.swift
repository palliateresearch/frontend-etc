//
//  SettingsViewModel.swift
//  PowerPlay
//
//  Created by Valerie Kwan on 7/14/23.
//

import Foundation

class SettingsData: ObservableObject{
    @Published var name : String = ""
    @Published var isParent : Bool = true
    @Published var username : String = ""
    @Published var park : String = ""
    @Published var children : [String] = []
    
    func getName() -> String {
        name = "Nishka Sharma"
        return name
    }
    
    func getIsParent() -> Bool {
        isParent = true
        return isParent
    }
    
    func getUsername() -> String {
        username = "nishka"
        return username
    }
    
    func getPark() -> String {
        park = "Fremont Park"
        return park
    }
    
    func getChildren() -> [String] {
        children = ["Valerie", "Aadit", "Nishka", "Eddie", "Vaughn"]
        return children
    }
    
}
