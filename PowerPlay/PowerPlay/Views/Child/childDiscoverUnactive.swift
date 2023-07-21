//
//  childDiscoverUnactive.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI

struct childDiscoverUnactive: View {
    var body: some View {
        NavigationStack{
            VStack{
                childCustomNavBar(navTitle: "Discover", color: "darkGray")
                Spacer()
                Image("lock")
                    .scaleEffect(1.75)
                    .padding()
                    .padding()
                    .padding()
                Spacer()
                childStartLesson(progress: 0.333333, background: "mediumGray", text: "lightGray", progressDone: "lightGray", shadow: "darkGray")
                Spacer()
              
            }
            .background(Color("lightGray"))

        }
        .background(Color("lightGray"))
    }
}

struct childDiscoverUnactive_Previews: PreviewProvider {
    static var previews: some View {
        childDiscoverUnactive()
    }
}
