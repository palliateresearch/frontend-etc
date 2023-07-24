//
//  PowerPlayApp.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/10/23.
//

import SwiftUI
import ConfettiSwiftUI

@main
struct PowerPlayApp: App {
    @StateObject private var pv = PV()
    var body: some Scene {
        WindowGroup {
            test()
        }
    }
}
