//
//  childStartView.swift
//  PowerPlay
//
//  Created by Valerie Kwan on 7/20/23.
//

import SwiftUI

struct childStartView: View {
    @ObservedObject var userData = UserViewData()
    @EnvironmentObject private var pv: PV
    var model = TestModel()
    
    @State var isParent: Bool = false
    
    @State private var loginViewActive = false
    @State private var registerViewAction = false
    @State private var guestViewActive = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("Welcome  to")
                    .fontDesign(.rounded)
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("darkBlue"))
                    .padding()
//                Image("Sparky")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 250, height: 250)
//                    .padding(.bottom, 10)
                ChildMascot(emotion: "", size: 0.18)
                        .frame(maxWidth: .infinity, maxHeight: 250, alignment: .center)
            .aspectRatio(contentMode: .fit)
                Text("PowerPlay")
                    .fontDesign(.rounded)
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("darkBlue"))
                    .padding()
                Spacer()
                VStack(spacing:0){
                    Button(action: {
                        registerViewAction = true
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 7)
                                .padding()
                                .frame(minHeight: 70)
                                .foregroundColor(Color("dropShadowBlue"))
                            RoundedRectangle(cornerRadius: 7)
                                .padding()
                                .padding([.bottom],6)
                                .frame(minHeight: 90)
                                .foregroundColor(Color("aliceBlue"))
                                .overlay{
                                    Text("REGISTER")
                                        .foregroundColor(Color("darkBlue"))
                                        .fontWeight(.heavy)
                                        .font(.title2)
                                        .fontDesign(.rounded)
                                }
                        }.frame(maxHeight: 75)
                    })
                    Button(action: {
                        guestViewActive = true
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 7)
                                .padding()
                                .frame(minHeight: 80)
                                .foregroundColor(Color("dropShadowBlue"))
                            RoundedRectangle(cornerRadius: 7)
                                .padding()
                                .padding([.bottom],6)
                                .frame(minHeight: 90)
                                .foregroundColor(Color("aliceBlue"))
                                .overlay{
                                    Text("LOGIN AS GUEST")
                                        .foregroundColor(Color("darkBlue"))
                                        .fontWeight(.heavy)
                                        .font(.title2)
                                        .fontDesign(.rounded)
                                }
                            
                        }
                    }).frame(maxHeight: 75)
                    Button(action: {
                        loginViewActive = true
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 7)
                                .padding()
                                .frame(minHeight: 80)
                                .foregroundColor(Color("dropShadowBlue"))
                            RoundedRectangle(cornerRadius: 7)
                                .padding()
                                .padding([.bottom],6)
                                .frame(minHeight: 90)
                                .foregroundColor(Color("darkBlue"))
                                .overlay{
                                    Text("SIGN IN")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.heavy)
                                        .font(.title2)
                                        .fontDesign(.rounded)
                                }
                            
                        }
                    }).frame(maxHeight: 75)
                    Button(action: {
                        model.myUsers.last?.isParent = true
                        model.save()
                        isParent = true
                        
                        print ("isParent is true")
                        
                    }) {
                        Text("Are you a parent?")
                            .fontDesign(.rounded)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(Color("darkBlue"))
                            .underline()
                    }
                    .padding(.top, 20)
                    .padding(.horizontal)
                }
                Spacer()
            }.frame(maxHeight:.infinity).background(LinearGradient(
                colors: [Color.white, Color("lightBlue")],
                startPoint: .top, endPoint: .bottom))
        }.padding().background(LinearGradient(
            colors: [Color.white, Color("lightBlue")],
            startPoint: .top, endPoint: .bottom))
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $loginViewActive) {
                childLogin()
        }
        .fullScreenCover(isPresented: $registerViewAction) {
                childRegister()
        }
        .fullScreenCover(isPresented: $guestViewActive) {
                FindParkGuest()
        }
        .fullScreenCover(isPresented: $isParent) {
                StartView()
        }

        
            
    }
}

struct childStartView_Previews: PreviewProvider {
    static var previews: some View {
        let pv = PV() // Create a mock instance of PV

        return childStartView()
            .environmentObject(pv) // Inject the mock instance as an environment object
    }
}
