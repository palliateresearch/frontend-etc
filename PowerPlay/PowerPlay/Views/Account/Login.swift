import SwiftUI
import AuthenticationServices

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var userSelect: Bool = false
    @State private var passSelect: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var isRegister: Bool = false
    
    @ObservedObject var userData = UserViewData()
    
    @State private var isUsernameValid: Bool = true
    @State private var isPasswordValid: Bool = true
    
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
                
                Text("Login")
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
                        TextField("Username", text: $userData.username)
                            .font(.system(size: width * 0.06, weight: .bold))
                            .foregroundColor(.white)
                            .disabled(!userSelect)
                            .opacity(userSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                    }
                }
                .padding(.top, height * 0.05)
                .overlay(
                    Text("Please enter your username")
                        .foregroundColor(.red)
                        .opacity(isUsernameValid ? 0 : 1)
   
                        .padding(.leading, width * 0.1),
                    alignment: .topLeading
                )
                
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
                        SecureField("Password", text: $userData.password)
                            .font(.system(size: width * 0.06, weight: .bold))
                            .foregroundColor(.white)
                            .disabled(!passSelect)
                            .opacity(passSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                    }
                }
                .padding(.top, height * 0.05)
                .overlay(
                    Text("Please enter your password")
                        .foregroundColor(.red)
                        .opacity(isPasswordValid ? 0 : 1)
              
                        .padding(.leading, width * 0.1),
                    alignment: .topLeading
                )
                Button(action: {
                    // Perform validation checks
                    isUsernameValid = !userData.username.isEmpty
                    isPasswordValid = !userData.password.isEmpty
                    
                    // Check if all validation checks passed
                    if isUsernameValid && isPasswordValid {
                        // All entries are valid, proceed with login
                        isLoggedIn = true
                    }
                }) {
                    Text("Sign In")
                        .font(.system(size: width * 0.06, weight: .bold))
                        .frame(width: width * 0.5, height: height * 0.075)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .opacity(0.8)
                        .cornerRadius(10)
                }
                .padding(.top, height * 0.04)
                
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.fullName, .email]
                } onCompletion: { result in
                    ContentView(userData: userData)
                }
                .frame(width: width * 0.7, height: height * 0.06)
                .padding(.top, height * 0.05)
                
               
                Button(action: {
                    isRegister = true
                }) {
                    Text("Don't have an account? Register")
                        .font(.system(size: width * 0.05, weight: .bold))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .foregroundColor(Color("navyBlue"))
                        .cornerRadius(10)
                }
                .padding(.bottom, height * 0.04)
                .sheet(isPresented: $isRegister) {
                    Register(userData: userData)
                }
                .padding(.horizontal, width * 0.1)
            }
            
            .fullScreenCover(isPresented: $isLoggedIn) {
                ContentView(userData: userData)
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
