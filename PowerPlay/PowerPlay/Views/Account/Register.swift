import SwiftUI
import AuthenticationServices

struct Register: View {
    @ObservedObject var userData: UserData
    
    @State private var userSelect: Bool = false
    @State private var passSelect: Bool = false
    @State private var firstSelect: Bool = false
    @State private var lastSelect: Bool = false
    
    @State private var isLoggedIn: Bool = false // Register vs Home
    
    @State private var isParentLocal: Bool = false
    
    @State private var isLogin: Bool = false // Register vs Login

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            VStack {
                Text("Register")
                    .font(.system(size: width * 0.08, weight: .bold))
                    .frame(width: width * 0.8)
                    .padding(.top, height * 0.03)
                    .foregroundColor(Color.white)
               
                
                 ZStack {
                     RoundedRectangle(cornerRadius: 15)
                         .fill(Color("navyBlue"))
                         .frame(width: width * 0.8, height: height * 0.08)
                         .opacity(firstSelect ? 1 : 0.4)
                         .overlay(
                             RoundedRectangle(cornerRadius: 15)
                                 .stroke(Color("lightningYellow"), lineWidth: firstSelect ? 2 : 0)
                         )
                     
                         .onTapGesture {
                             firstSelect = true
                             lastSelect = false
                             userSelect = false
                             passSelect = false
                         }
                     VStack {
                  
                         TextField("First Name", text: $userData.firstName)
                             .font(.system(size: width * 0.06, weight: .bold))
                             .foregroundColor(.white)
                             .disabled(!firstSelect)
                             .opacity(firstSelect ? 1 : 0.4)
                             .padding(.leading, width * 0.15)
                     
                     }
                 }
                 .padding(.top, height * 0.03)
                
                 ZStack {
                     RoundedRectangle(cornerRadius: 15)
                         .fill(Color("navyBlue"))
                         .frame(width: width * 0.8, height: height * 0.08)
                         .opacity(lastSelect ? 1 : 0.4)
                         .overlay(
                             RoundedRectangle(cornerRadius: 15)
                                 .stroke(Color("lightningYellow"), lineWidth: lastSelect ? 2 : 0)
                         )
                     
                         .onTapGesture {
                             firstSelect = false
                             lastSelect = true
                             userSelect = false
                             passSelect = false
                         }
                     VStack {
                  
                         TextField("Last Name", text: $userData.lastName)
                             .font(.system(size: width * 0.06, weight: .bold))
                             .foregroundColor(.white)
                             .disabled(!lastSelect)
                             .opacity(lastSelect ? 1 : 0.4)
                             .padding(.leading, width * 0.15)
                     
                     }
                 }
                 .padding(.top, height * 0.03)
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("navyBlue"))
                        .frame(width: width * 0.8, height: height * 0.08)
                        .opacity(userSelect ? 1 : 0.4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("lightningYellow"), lineWidth: userSelect ? 2 : 0)
                        )
                    
                        .onTapGesture {
                            firstSelect = false
                            lastSelect = false
                            userSelect = true
                            passSelect = false
                        }
                    VStack {
                 
                        TextField("Username", text: $userData.username)
                            .font(.system(size: width * 0.06, weight: .bold))
                            .foregroundColor(.white)
                            .disabled(!userSelect)
                            .opacity(userSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                    
                    }
                }
                .padding(.top, height * 0.03)
                

                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("navyBlue"))
                        .frame(width: width * 0.8, height: height * 0.08)
                        .opacity(passSelect ? 1 : 0.4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("lightningYellow"), lineWidth: passSelect ? 2 : 0)
                        )
                    
                        .onTapGesture {
                            firstSelect = false
                            lastSelect = false
                            userSelect = false
                            passSelect = true
                        }
                    VStack {
                       
                       SecureField("Password", text: $userData.password)
                            .font(.system(size: width * 0.06, weight: .bold))
                            .foregroundColor(.white)
                            .disabled(!passSelect)
                            .opacity(passSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                      
                    }
                }.padding(.top, height * 0.03)
                
                Toggle(isOn: $isParentLocal) {
                    Text("Create Parent Account?")
                }
                .toggleStyle(iOSCheckboxToggleStyle())
                .font(.system(size: width * 0.06, weight: .bold))
                .foregroundColor(Color("lightningYellow"))
                .padding(.top, height * 0.03)
                
                Button(action: {
                    userData.isParent = isParentLocal
                    isLoggedIn = true
                }){
                    Text("Register")
                        .font(.system(size: width * 0.06, weight: .bold))
                        .frame(width: width * 0.5, height: height * 0.075)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .opacity(0.8)
                        .cornerRadius(10)
                }.padding(.top, height * 0.03)
                
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.fullName, .email]
                        
                } onCompletion: { result in
                    isLoggedIn = true
                }
                .frame(width: width * 0.7, height: height * 0.06)
                .padding(.top, height * 0.03)
               

                Button(action: {
                    isLogin = true
                }){
                    Text("Already have an account? Login")
                        .font(.system(size: width * 0.05, weight: .bold))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .foregroundColor(Color("navyBlue"))
                        .cornerRadius(10)
                }



                .padding(.horizontal, width * 0.1)
            }
            .fullScreenCover(isPresented: $isLoggedIn) {
                if (isParentLocal) {
                    EnterChildren(userData: userData)
                } else {
                    FindPark(userData: userData)
                }
               
            }

            .fullScreenCover(isPresented: $isLogin) {
                Login()
            }
            
            .preferredColorScheme(.dark)
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        })
    }
}
