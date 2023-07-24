//
//  childDiscoverScroll.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI

struct childDiscoverScroll: View {
    
    @State private var selectedTab: Int = 0
    @State private var color: String?
    @State var childModel = currentLesson()
    @State var first: childDiscoverActive?
    @State var second: childDiscoverActive?
    @State var third: childDiscoverUnactive?
    
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab){
                childDiscoverActive(progress: childModel.progressC1).tag(0)
                childDiscoverActive(progress: childModel.progressC2).tag(1)
                childDiscoverUnactive().tag(2)
            }
            .background((selectedTab == 0 || selectedTab == 1) ? Color("lightBlue") : Color("lightGray"))
            .tabViewStyle(PageTabViewStyle())
        }
        
        
        
    }
}

struct childDiscoverScroll_Previews: PreviewProvider {
    static var previews: some View {
        childDiscoverScroll()
    }
}
