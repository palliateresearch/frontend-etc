//
//  AchievementsViewModel.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/13/23.
//

import Foundation

class UserViewData: ObservableObject {
    @Published var id = UUID()
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var park: String = ""
    @Published var children: [String] = []
    @Published var isParent: Bool = false
}

