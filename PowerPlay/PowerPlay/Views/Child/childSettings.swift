//
//  Settings.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/12/23.
//

import SwiftUI

struct childSettings: View {
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
                        Image("Sparky")
                            .scaleEffect(0.1)
                            .frame(width: 200, height: 125)
                            .aspectRatio(contentMode: .fit)
//                        Text("Palliate")
                        Text("\(userData.firstName) \(userData.lastName)")
                            .fontDesign(.rounded)
                            .foregroundColor(Color("darkBlue"))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size:30))
                            .fontWeight(.heavy)
                            .padding()
                    }
                }
                VStack{
                    HStack{
                        Text("Account Type")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .foregroundColor(Color("darkBlue"))
                            .padding()
                            .bold()
                        Text(userData.isParent ? "Parent" : "Child")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.title2)
                            .padding()
                            .foregroundColor(Color.black)
                    }
                    HStack{
                        Text("Username")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .foregroundColor(Color("darkBlue"))
                            .bold()
                            .padding()
                        Text(userData.username)
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.title2)
                            .padding()
                            .foregroundColor(Color.black)
                    }
                    HStack{
                        Text("Park")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .foregroundColor(Color("darkBlue"))
                            .padding()
                            .bold()
                        Text(userData.park)
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.title2)
                            .padding()
                            .foregroundColor(Color.black)
                    }
                }
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                Button {
                    isLogout = true
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 7)
                            .padding()
                            .frame(minHeight: 80)
                            .foregroundColor(Color("dropShadowLogoutRed"))
                        RoundedRectangle(cornerRadius: 7)
                            .padding()
                            .padding([.bottom],6)
                            .frame(minHeight: 90)
                            .foregroundColor(Color("logoutRed"))
                            .overlay{
                                Text("LOG OUT")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.heavy)
                                    .fontDesign(.rounded)
                                    .font(.title2)
                            }
                        
                    }
                    .padding([.bottom], 70)
                }
            }
            .fullScreenCover(isPresented: $isLogout) {
                StartView()
            }.padding()
                .background(LinearGradient(
                    colors: [Color.white, Color("lightBlue")],
                    startPoint: .top, endPoint: .bottom))
        }
    }
}


struct childSettings_Previews: PreviewProvider {
    static var previews: some View {
        childSettings()
    }
}
