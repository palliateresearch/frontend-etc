import SwiftUI

struct childRegister: View {
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
                   .foregroundColor(Color("darkBlue"))

                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("aliceBlue"))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .opacity(firstSelect ? 1 : 0.4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("darkBlue"), lineWidth: firstSelect ? 2 : 0)
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
                            .foregroundColor(Color("darkBlue"))
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
                        .fill(Color("aliceBlue"))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .opacity(lastSelect ? 1 : 0.4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("darkBlue"), lineWidth: lastSelect ? 2 : 0)
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
                            .foregroundColor(Color("darkBlue"))
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
                        .fill(Color("aliceBlue"))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .opacity(userSelect ? 1 : 0.4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("darkBlue"), lineWidth: userSelect ? 2 : 0)
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
                            .foregroundColor(Color("darkBlue"))
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
                        .fill(Color("aliceBlue"))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .opacity(passSelect ? 1 : 0.4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("darkBlue"), lineWidth: passSelect ? 2 : 0)
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
                            .foregroundColor(Color("darkBlue"))
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
                .foregroundColor(Color("darkBlue"))
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
                    }}, label:{
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
                                Text("Register")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.heavy)
                                    .font(.title2)
                                    .fontDesign(.rounded)
                            }
                        
                    }
                    }).frame(maxHeight: 75).padding()

                Spacer()

                Button(action: {
                    isLogin = true
                }) {
                    Text("Already have an account? Login")
                        .fontDesign(.rounded)
                        .font(.system(size: width * 0.05, weight: .bold))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .foregroundColor(Color("darkBlue"))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal, width * 0.1)
            }
            .fullScreenCover(isPresented: $isLoggedIn) {
                if pv.isParent {
                    EnterChildren()
                } else if let user = model.myUser, !(user.park?.isEmpty ?? true) {
                    childContentView()
                } else {
                    FindPark()
                }
            }
            .fullScreenCover(isPresented: $isLogin) {
                childLogin()
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
        .background(Color("lightBlue"))
        .preferredColorScheme(.light)
    }
}

struct childRegister_Previews: PreviewProvider {
    static var previews: some View {
        let pv = PV() // Create a mock instance of PV

        return childRegister()
            .environmentObject(pv) // Inject the mock instance as an environment objec
    }
}

