import SwiftUI

struct Register: View {
    @EnvironmentObject private var pv: PV
    var model = TestModel()

    @State private var userSelect: Bool = false
    @State private var passSelect: Bool = false
    @State private var firstSelect: Bool = false
    @State private var lastSelect: Bool = false

    @State private var isLoggedIn: Bool = false
    @State private var isParentLocal: Bool = false
    @State private var isLogin: Bool = false

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
                    .fontDesign(.rounded)
                    .font(.system(size: width * 0.08, weight: .bold))
                    .frame(width: width * 0.8)
                    .padding(.top, height * 0.03)
                    .foregroundColor(Color.white)

                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("navyBlue"))
                        .frame(width: width * 0.8, height: height * 0.1)
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
                        TextField("First Name", text: $pv.firstName)
                            .fontDesign(.rounded)
                            .font(.system(size: width * 0.06, weight: .bold))
                            .foregroundColor(firstSelect ? .white : .white)
                            .disabled(!firstSelect)
                            .opacity(firstSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                    }
                }
                .padding(.top, height * 0.03)
                .overlay(
                    Text("Please enter your first name")
                        .fontDesign(.rounded)
                        .foregroundColor(.red)
                        .opacity(isFirstNameValid ? 0 : 1)
                        .padding(.leading, width * 0.1),
                    alignment: .topLeading
                )

                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("navyBlue"))
                        .frame(width: width * 0.8, height: height * 0.1)
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
                        TextField("Last Name", text: $pv.lastName)
                            .fontDesign(.rounded)
                            .font(.system(size: width * 0.06, weight: .bold))
                            .foregroundColor(lastSelect ? .white : .white)
                            .disabled(!lastSelect)
                            .opacity(lastSelect ? 1 : 0.4)
                            .padding(.leading, width * 0.15)
                    }
                }
                .padding(.top, height * 0.03)
                .overlay(
                    Text("Please enter your last name")
                        .fontDesign(.rounded)
                        .foregroundColor(.red)
                        .opacity(isLastNameValid ? 0 : 1)
                        .padding(.leading, width * 0.1),
                    alignment: .topLeading
                )

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
                            firstSelect = false
                            lastSelect = false
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
                .padding(.top, height * 0.03)
                .overlay(
                    Text("Username must be at least 4 characters long")
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
                            firstSelect = false
                            lastSelect = false
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
                .padding(.top, height * 0.03)
                .overlay(
                    Text("Password must be at least 4 characters long")
                        .fontDesign(.rounded)
                        .fontDesign(.rounded)
                        .foregroundColor(.red)
                        .opacity(isPasswordValid ? 0 : 1)
                        .padding(.leading, width * 0.1),
                    alignment: .topLeading
                )

                Toggle(isOn: $pv.isParent) {
                    Text("Are You a Parent?")
                        .fontDesign(.rounded)
                }
                .toggleStyle(iOSCheckboxToggleStyle())
                .font(.system(size: width * 0.06, weight: .bold))
                .foregroundColor(Color("lightningYellow"))
                .padding(.top, height * 0.03)

                Button(action: {
                    // Perform validation checks
                    isFirstNameValid = !pv.firstName.isEmpty
                    isLastNameValid = !pv.lastName.isEmpty
                    isUsernameValid = pv.username.count >= 4
                    isPasswordValid = pv.password.count >= 4

                    // Check if all validation checks passed
                    if isFirstNameValid && isLastNameValid && isUsernameValid && isPasswordValid {
                        // All entries are valid, proceed with registration
                        model.myUser?.firstName = pv.firstName
                        model.myUser?.lastName = pv.lastName
                        model.myUser?.username = pv.username
                        model.myUser?.password = pv.password
                        model.myUser?.isParent = pv.isParent // Save isParent value
                        model.save()

                        // Perform the appropriate action based on the isParent flag
                        isLoggedIn = true
                       
                    }
                }) {
                    Text("Register")
                        .fontDesign(.rounded)
                        .font(.system(size: width * 0.06, weight: .bold))
                        .frame(width: width * 0.5, height: height * 0.075)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .opacity(0.8)
                        .cornerRadius(10)
                }
                .padding(.top, height * 0.03)

                Spacer()

                Button(action: {
                    isLogin = true
                }) {
                    Text("Already have an account? Login")
                        .fontDesign(.rounded)
                        .font(.system(size: width * 0.05, weight: .bold))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .foregroundColor(Color("lightningYellow"))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal, width * 0.1)
            }
            .fullScreenCover(isPresented: $isLoggedIn) {
                if pv.isParent {
                    EnterChildren()
                } else if let user = model.myUser, !(user.park?.isEmpty ?? true) {
                    ContentView()
                } else {
                    FindPark()
                }
            }
            .fullScreenCover(isPresented: $isLogin) {
                Login()
            }
            .onAppear {
                model.load()

                DispatchQueue.main.async {
                    pv.firstName = model.myUser?.firstName ?? ""
                    pv.lastName = model.myUser?.lastName ?? ""
                    pv.username = model.myUser?.username ?? ""
                    pv.password = model.myUser?.password ?? ""
                    pv.isParent = model.myUser?.isParent ?? false
                }
            }
        }
        .background(Color("darkModeBackground"))
        .preferredColorScheme(.dark)
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
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
