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
    
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab){
                childDiscoverActive().tag(0)
                childDiscoverUnactive().tag(1)
            }
            .background(selectedTab == 0 ? Color("lightBlue") : Color("lightGray"))
            .tabViewStyle(PageTabViewStyle())
        }
        
        
        
    }
}

struct childDiscoverScroll_Previews: PreviewProvider {
    static var previews: some View {
        childDiscoverScroll()
    }
}
