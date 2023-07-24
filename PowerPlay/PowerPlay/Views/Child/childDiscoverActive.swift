//
//  childDiscoverActive.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI

struct childDiscoverActive: View {
    
    var body: some View {
        NavigationStack{
            
            VStack{
                childCustomNavBar(navTitle: "Discover", color: "darkBlue")
                Spacer()
                Image("sparkyWithClouds")
                    .scaleEffect(2)
                    .padding()
                    .padding()
                    .padding()
                Spacer()
                childStartLesson(progress: 0.333333, background: "darkBlue", text: "aliceBlue", progressDone: "lightningYellow", shadow: "dropShadowBlue", nextPage: childLesson(image: "sparkyWithClouds", chapter: "The Power of Electricity", lesson: "Lesson 1: What is it about?", header: ["hello", "What is Electricity?", "is", "a", "test"], content: ["hello", "Electricity is the flow of tiny particles called electrons. These electrons carry energy. ", "is", "a", "test"], frameSize: [375,375,375,375,375]))
                
                Spacer()
              
            }
            .background(Color("lightBlue"))

        }
        .background(Color("lightBlue"))
    }
}

struct childDiscoverActive_Previews: PreviewProvider {
    static var previews: some View {
        childDiscoverActive()
    }
}



