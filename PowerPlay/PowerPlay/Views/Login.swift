import SwiftUI
import AuthenticationServices

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var userSelect: Bool = false
    @State private var passSelect: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var isRegister: Bool = false

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            VStack {
                HStack {
                    Spacer()
                    
                    Image("palliateIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width * 0.55)
                        .padding(.bottom, 10)
                    
                    Spacer()
                }
                .padding(.top, width * 0.04)
                
                Text("Login or Register")
                    .font(.system(size: width * 0.08, weight: .bold))
                    .frame(width: width * 0.8)
                    .padding(.top, height * 0.03)
                    .foregroundColor(Color.white)
               
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("navyBlue"))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .opacity(userSelect ? 1 : 0.4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("lightningYellow"), lineWidth: userSelect ? 2 : 0)
                        )
                    
                        .onTapGesture {
                            userSelect = true
                            passSelect = false
                        }
                    VStack {
                 
                        TextField("Username", text: $username)
                            .font(.system(size: width * 0.06, weight: .bold))
                            .foregroundColor(.white)
                            .disabled(!userSelect)
                            .opacity(userSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                    
                    }
                }
                .padding(.top, height * 0.05)
                

                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("navyBlue"))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .opacity(passSelect ? 1 : 0.4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("lightningYellow"), lineWidth: passSelect ? 2 : 0)
                        )
                    
                        .onTapGesture {
                            userSelect = false
                            passSelect = true
                        }
                    VStack {
                       
                        TextField("Password", text: $password)
                            .font(.system(size: width * 0.06, weight: .bold))
                            .foregroundColor(.white)
                            .disabled(!passSelect)
                            .opacity(passSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                      
                    }
                }.padding(.top, height * 0.05)
                
                Button(action: {
                    isLoggedIn = true
                }){
                    Text("Sign In")
                        .font(.system(size: width * 0.06, weight: .bold))
                        .frame(width: width * 0.5, height: height * 0.075)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .opacity(0.8)
                        .cornerRadius(10)
                }.padding(.top, height * 0.04)
                
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.fullName, .email]
                        
                } onCompletion: { result in
                    
                }
                .frame(width: width * 0.7, height: height * 0.06)
               

                Button(action: {
                    isRegister = true
                }){
                    Text("Don't have an account? Register")
                        .font(.system(size: width * 0.05, weight: .bold))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .foregroundColor(Color("navyBlue"))
                        .cornerRadius(10)
                }.padding(.top, height * 0.06)



                .padding(.horizontal, width * 0.1)
            }
            .fullScreenCover(isPresented: $isLoggedIn) {
                ContentView()
            }
            
            .preferredColorScheme(.dark)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
