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
    @State var park = ""
    var body: some Scene {
        WindowGroup {
            childContentView()
        }
    }
}
