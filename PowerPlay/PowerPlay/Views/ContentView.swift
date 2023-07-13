//
//  ContentView.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabColor: Color!
    
    init() {
      UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }

    var body: some View {
        VStack {
            TabView {
                Home()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
                .tag(0)
                
                Achievements()
                .tabItem {
                    Label("Achievements", systemImage: "trophy")
                        
                }
                
                Discover()
                    .tabItem {
                        Label("Discover",
                              systemImage: "books.vertical")
                }
                Settings()
                    .tabItem {
                        Label("Settings",
                              systemImage: "gear")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .light)
        ContentView().environment(\.colorScheme, .dark)
    }
}
