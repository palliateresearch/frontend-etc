import SwiftUI
import CoreData

struct Login: View {
    @EnvironmentObject private var pv: PV
    var model = TestModel()

    @State private var userSelect: Bool = false
    @State private var passSelect: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var isRegister: Bool = false

    @State private var isUsernameValid: Bool = true
    @State private var isPasswordValid: Bool = true
    @State private var isInvalidCredentials: Bool = false

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height

            VStack {
                Image("palliateIcon") // Add the image asset here
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width * 0.5, height: height * 0.2) // Adjust the size as needed

                Text("Login")
                    .fontDesign(.rounded)
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
                        TextField("Username", text: $pv.username)
                            .fontDesign(.rounded)
                            .font(.system(size: width * 0.06, weight: .bold))
                            .foregroundColor(userSelect ? .white : .white)
                            .disabled(!userSelect)
                            .opacity(userSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                    }
                }
                .padding(.top, height * 0.05)
                .overlay(
                    Text("Please enter your username")
                        .fontDesign(.rounded)
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
                        SecureField("Password", text: $pv.password)
                            .fontDesign(.rounded)
                            .font(.system(size: width * 0.06, weight: .bold))
                            .foregroundColor(passSelect ? .white : .white)
                            .disabled(!passSelect)
                            .opacity(passSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                    }
                }
                .padding(.top, height * 0.05)
                .overlay(
                    Text("Please enter your password")
                        .fontDesign(.rounded)
                        .foregroundColor(.red)
                        .opacity(isPasswordValid ? 0 : 1)
                        .padding(.leading, width * 0.1),
                    alignment: .topLeading
                )

                Button(action: {
                    isUsernameValid = !pv.username.isEmpty
                    isPasswordValid = !pv.password.isEmpty

                    if isUsernameValid && isPasswordValid {
                        model.load()
                        let savedUsername = model.myUser?.username ?? ""
                        let savedPassword = model.myUser?.password ?? ""

                        if savedUsername == pv.username && savedPassword == pv.password {
                            isLoggedIn = true
                        } else {
                            isInvalidCredentials = true
                        }
                    } else {
                        isInvalidCredentials = true
                    }
                }) {
                    Text("Sign In")
                        .fontDesign(.rounded)
                        .font(.system(size: width * 0.06, weight: .bold))
                        .frame(width: width * 0.5, height: height * 0.075)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .opacity(0.8)
                        .cornerRadius(10)
                }
                .padding(.top, height * 0.04)

                if isInvalidCredentials {
                    Text("Invalid username or password")
                        .fontDesign(.rounded)
                        .foregroundColor(.red)
                        .padding(.top, height * 0.02)
                }

                Spacer()
                Button(action: {
                    isRegister = true
                }) {
                    Text("Don't have an account? Register")
                        .fontDesign(.rounded)
                        .font(.system(size: width * 0.05, weight: .bold))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .foregroundColor(Color("lightningYellow"))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal, width * 0.1)
                .sheet(isPresented: $isRegister) {
                    Register()
                }
            }
            .fullScreenCover(isPresented: $isLoggedIn) {
                ContentView()
            }
            .background(Color("darkModeBackground"))
            .preferredColorScheme(.dark)
            .onAppear {
                model.load()

                DispatchQueue.main.async {
                    pv.username = model.myUser?.username ?? ""
                    pv.password = model.myUser?.password ?? ""
                }
            }
        }
    }
}
