//
//  GuestContentView.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/14/23.
//

import SwiftUI

struct GuestContentView: View {
    @State private var tabColor: Color!

    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }

    var body: some View {
        VStack {
            TabView {
                GuestHome() 
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(0)
                
                Achievements()
                    .tabItem {
                        Label("Achievements", systemImage: "trophy")
                    }
                
                Discover()
                    .tabItem {
                        Label("Discover", systemImage: "books.vertical")
                    }
                
                Settings()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
            .tint(Color("lightningYellow"))
        }
        .preferredColorScheme(.dark)
        .foregroundColor(.white)
        .background(Color.black.opacity(0.5))
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct GuestContentView_Previews: PreviewProvider {
    static var previews: some View {
        GuestContentView().environment(\.colorScheme, .light)
        GuestContentView().environment(\.colorScheme, .dark)
    }
}

