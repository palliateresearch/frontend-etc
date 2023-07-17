//
//  PowerPlayApp.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/10/23.
//

import SwiftUI

@main
struct PowerPlayApp: App {
    
    let guestData = GuestData()
    let homeData = Home_ViewModel_Data()
    
    @State var park = ""
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(guestData)
                .environmentObject(homeData)
        }
    }
}
