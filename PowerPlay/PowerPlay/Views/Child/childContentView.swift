//
//  childContentView.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI


struct childContentView: View {
    @ObservedObject var userData = UserViewData()
    @State private var tabColor: Color!
    @State var childModel = CurrentLesson()
    @StateObject var childData = ChildViewData()
    
    @State private var park: String = ""

    var body: some View {
        VStack {
            TabView {
                childHomePark(userData: UserViewData(), childViewData: childData) // Pass the park binding to the Home view
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(0)
                
                childAchievements(userData: UserViewData())
                    .tabItem {
                        Label("Achievements", systemImage: "trophy")
                    }
                
                childDiscoverScroll(childData: childData)
                    .tabItem {
                        Label("Discover", systemImage: "books.vertical")
                    }
                
                childSettings(childData: childData)
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
            .accentColor(Color("darkBlue"))
            .preferredColorScheme(.light)
        }

    }
   
}

struct childContentView_Previews: PreviewProvider {
    static var previews: some View {
        childContentView()
    }
}
