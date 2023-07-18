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
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical)
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack{
                        Image("personfillyellow")
                            .aspectRatio(contentMode: .fill)
                            .scaleEffect(1)
                            .foregroundColor(Color("lightningYellow"))
                        Text("\(userData.firstName) \(userData.lastName)")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.title2)
                            .bold()
                            .padding()
                    }
                }
                        HStack{
                            Text("Account Type")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title3)
                                .foregroundColor(Color("lightningYellow"))
                                .padding()
                            Text(userData.isParent ? "Parent" : "Child")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.title3)
                                .padding()
                        }
                        HStack{
                            Text("Username")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title3)
                                .foregroundColor(Color("lightningYellow"))
                                .padding()
                            Text(userData.username)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.title3)
                                .padding()
                        }
                        HStack{
                            Text("Park")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title3)
                                .foregroundColor(Color("lightningYellow"))
                                .padding()
                            Text(userData.park)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.title3)
                                .padding()
                        }
                        HStack{
                            Text("Children")
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .font(.title3)
                                .foregroundColor(Color("lightningYellow"))
                                .padding()
                            let children = userData.children
                            Text(children.dropLast().joined(separator: ", "))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.title3)
                                .padding()
                                }

                }
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
        }.padding().preferredColorScheme(.dark)
        .fullScreenCover(isPresented: $isLogout) {
                StartView()
        }
    }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
