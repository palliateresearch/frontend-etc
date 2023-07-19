//
//  Settings.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI

struct Settings: View {
    @ObservedObject var userData = UserViewData()
    @State var isLogout = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("Settings")
                        .fontDesign(.rounded)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack{
                        Image("personfillyellow")
                            .scaleEffect(0.3)
                            .foregroundColor(Color("lightningYellow"))
                            .frame(width: 300, height: 150)
                            .aspectRatio(contentMode: .fit)
                        Text("\(userData.firstName) \(userData.lastName)")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.title2)
                            .bold()
                            .padding()
                    }
                }
                VStack{
                    HStack{
                        Text("Account Type")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3)
                            .foregroundColor(Color("lightningYellow"))
                            .padding()
                        Text(userData.isParent ? "Parent" : "Child")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.title3)
                            .padding()
                    }
                    HStack{
                        Text("Username")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3)
                            .foregroundColor(Color("lightningYellow"))
                            .padding()
                        Text(userData.username)
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.title3)
                            .padding()
                    }
                    HStack{
                        Text("Park")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3)
                            .foregroundColor(Color("lightningYellow"))
                            .padding()
                        Text(userData.park)
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.title3)
                            .padding()
                    }
                    HStack{
                        Text("Children")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .font(.title3)
                            .foregroundColor(Color("lightningYellow"))
                            .padding()
                        let children = userData.children
                        Text(children.dropLast().joined(separator: ", "))
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.title3)
                            .padding()
                    }
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Button {
                    isLogout = true
                } label: {
                    Text("Logout")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            } .background(Color("darkModeBackground"))
                .foregroundColor(Color.white)
        }
        .fullScreenCover(isPresented: $isLogout) {
                StartView()
        .background(Color("darkModeBackground"))
        }
    }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
