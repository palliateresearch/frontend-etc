//
//  PowerPlayApp.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/10/23.
//

import SwiftUI

@main
struct PowerPlayApp: App {
    @ObservedObject var userData = UserViewData()
    @StateObject private var pv = PV()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(pv)
        }
    }
}
