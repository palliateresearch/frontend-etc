import SwiftUI
import AuthenticationServices

struct Register: View {
    @ObservedObject var userData = UserViewData()
    
    @State private var userSelect: Bool = false
    @State private var passSelect: Bool = false
    @State private var firstSelect: Bool = false
    @State private var lastSelect: Bool = false
    
    @State private var isLoggedIn: Bool = false // Register vs Home
    
    @State private var isParentLocal: Bool = false
    
    @State private var isLogin: Bool = false // Register vs Login
    
    @State private var isFirstNameValid: Bool = true
    @State private var isLastNameValid: Bool = true
    @State private var isUsernameValid: Bool = true
    @State private var isPasswordValid: Bool = true
    
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
                            .foregroundColor(firstSelect ? .white : .white) // Modify the foreground color
                            .disabled(!firstSelect)
                            .opacity(firstSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                    }
                }
                .padding(.top, height * 0.03)
                .overlay(
                    Text("Please enter your first name")
                        .foregroundColor(.red)
                        .opacity(isFirstNameValid ? 0 : 1)
                       
                        .padding(.leading, width * 0.1),
                    alignment: .topLeading
                )
                
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
                            .foregroundColor(lastSelect ? .white : .white) // Modify the foreground color
                            .disabled(!lastSelect)
                            .opacity(lastSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                    }
                }
                .padding(.top, height * 0.03)
                .overlay(
                    Text("Please enter your last name")
                        .foregroundColor(.red)
                        .opacity(isLastNameValid ? 0 : 1)
                    
                        .padding(.leading, width * 0.1),
                    alignment: .topLeading
                )
                
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
                            .foregroundColor(userSelect ? .white : .white) // Modify the foreground color
                            .disabled(!userSelect)
                            .opacity(userSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                    }
                }
                .padding(.top, height * 0.03)
                .overlay(
                    Text("Username must be at least 4 characters long")
                        .foregroundColor(.red)
                        .opacity(isUsernameValid ? 0 : 1)
                       
                        .padding(.leading, width * 0.1),
                    alignment: .topLeading
                )
                
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
                            .foregroundColor(passSelect ? .white : .white) // Modify the foreground color
                            .disabled(!passSelect)
                            .opacity(passSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                    }
                }
                .padding(.top, height * 0.03)
                .overlay(
                    Text("Password must be at least 4 characters long")
                        .foregroundColor(.red)
                        .opacity(isPasswordValid ? 0 : 1)
                       
                        .padding(.leading, width * 0.1),
                    alignment: .topLeading
                )
                
                Toggle(isOn: $isParentLocal) {
                    Text("Create Parent Account?")
                }
                .toggleStyle(iOSCheckboxToggleStyle())
                .font(.system(size: width * 0.06, weight: .bold))
                .foregroundColor(Color("lightningYellow"))
                .padding(.top, height * 0.03)
                
                Button(action: {
                    // Perform validation checks
                    isFirstNameValid = !userData.firstName.isEmpty
                    isLastNameValid = !userData.lastName.isEmpty
                    isUsernameValid = userData.username.count >= 4
                    isPasswordValid = userData.password.count >= 4
                    
                    // Check if all validation checks passed
                    if isFirstNameValid && isLastNameValid && isUsernameValid && isPasswordValid {
                        // All entries are valid, proceed with registration
                        userData.isParent = isParentLocal
                        isLoggedIn = true
                    }
                }) {
                    Text("Register")
                        .font(.system(size: width * 0.06, weight: .bold))
                        .frame(width: width * 0.5, height: height * 0.075)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .opacity(0.8)
                        .cornerRadius(10)
                }
                .padding(.top, height * 0.03)
                
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.fullName, .email]
                } onCompletion: { result in
                    isLoggedIn = true
                }
                .frame(width: width * 0.7, height: height * 0.06)
                .padding(.top, height * 0.03)
                
                Button(action: {
                    isLogin = true
                }) {
                    Text("Already have an account? Login")
                        .font(.system(size: width * 0.05, weight: .bold))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .foregroundColor(Color("navyBlue"))
                        .cornerRadius(10)
                }
                .padding(.horizontal, width * 0.1)
            }
            .fullScreenCover(isPresented: $isLoggedIn) {
                if isParentLocal {
                    EnterChildren(userData: userData)
                } else {
                    FindPark(userData: userData)
                }
            }
            .fullScreenCover(isPresented: $isLogin) {
                Login()
            }
            
           
            
        }
        .background(Color("darkModeBackground"))
        .preferredColorScheme(.dark)
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register(userData: UserViewData())
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
    }
}
