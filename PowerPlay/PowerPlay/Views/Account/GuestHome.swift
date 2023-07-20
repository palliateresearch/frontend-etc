//
//  GuestHome.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI
import Charts

struct GuestHome: View {
    var model = TestModel()
    
    @State var progress: CGFloat = 0.75
    @State var toStart = false

    var body: some View {
        NavigationStack{
            ScrollView{
                HStack{
                    Text("PowerPlay")
                        .fontDesign(.rounded)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical)
                    Button(action: {
                        toStart = true
                    }) {
                        HStack{
                            Text("Guest").foregroundColor(Color.white)
                                .fontDesign(.rounded)
                            Image(systemName: "person.crop.circle.fill")
                                .scaleEffect(2.3)
                                .padding()
                                .foregroundColor(Color("lightningYellow"))
                        }
                    }
                }
                Text("\(model.myUser?.park ?? "") - January") // Using model to access park
                    .fontDesign(.rounded)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
                    .bold()
                    .padding(.top)
                    .fontDesign(.rounded)
                // Rest of the code remains unchanged
                // ...
            }
        }
        .foregroundColor(Color.white)
        .background(Color("darkModeBackground"))
        .scrollIndicators(.hidden)
        .padding()
        .background(Color("darkModeBackground"))
        .fullScreenCover(isPresented: $toStart) {
            StartView()
        }
        .onAppear {
            model.load() // Loading data from the model
        }
    }
}

struct GuestHome_Previews: PreviewProvider {
    static var previews: some View {
        GuestHome().environment(\.colorScheme, .light)
        GuestHome().environment(\.colorScheme, .dark)
    }
}
