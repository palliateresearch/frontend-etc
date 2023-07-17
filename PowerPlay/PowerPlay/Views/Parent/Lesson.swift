//
//  Lesson.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/14/23.
//

import SwiftUI

struct Lesson: View {
  
    @ObservedObject var userData = UserViewData()
  
    var body: some View {
        NavigationStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct Lesson_Previews: PreviewProvider {
    static var previews: some View {
        Lesson()
    }
}
