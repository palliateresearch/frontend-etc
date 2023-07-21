//
//  childCustomNavBar.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI

struct childCustomNavBar: View {
    
    @State var navTitle: String?
    @State var color: String?

    var body: some View {
        VStack{
            Text(navTitle!)
                .font(.title3)
                .bold()
                .padding()
                .fontDesign(.rounded)
                .foregroundColor(Color(color!))
            Divider()
                .frame(minHeight: 3)
                .overlay(Color(color!))
        }
        .frame(alignment: .topLeading)
    }
}

struct childCustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        childCustomNavBar()
    }
}
