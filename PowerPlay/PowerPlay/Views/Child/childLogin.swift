import SwiftUI
import CoreData

struct childLogin: View {
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
                Spacer()
                Image("palliateIcon") // Add the image asset here
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width * 0.5, height: height * 0.2) // Adjust the size as needed

                Text("Login")
                    .fontDesign(.rounded)
                    .font(.system(size: 40, weight: .bold))
                    .frame(width: width * 0.8)
                    .padding(.top, height * 0.03)
                    .foregroundColor(Color("darkBlue"))
                    .fontWeight(.heavy)

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
                            userSelect = true
                            passSelect = false
                        }
                    VStack {
                        TextField("Username", text: $pv.username)
                            .fontDesign(.rounded)
                            .font(.system(size: width * 0.06, weight: .bold))
                            .foregroundColor(Color.black)
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
                        .fill(Color("aliceBlue"))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .opacity(passSelect ? 1 : 0.4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("darkBlue"), lineWidth: passSelect ? 2 : 0)
                        )
                        .onTapGesture {
                            userSelect = false
                            passSelect = true
                        }
                    VStack {
                        SecureField("Password", text: $pv.password)
                            .fontDesign(.rounded)
                            .font(.system(size: width * 0.06, weight: .bold))
                            .foregroundColor(Color.black)
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
                Spacer()
                Button(action: {
                    isUsernameValid = !pv.username.isEmpty
                    isPasswordValid = !pv.password.isEmpty

                    if isUsernameValid && isPasswordValid {
                        model.load()
                        let savedUsername = model.myUsers.last?.username ?? ""
                        let savedPassword = model.myUsers.last?.password ?? ""

                        if savedUsername == pv.username && savedPassword == pv.password {
                            isLoggedIn = true
                        } else {
                            isInvalidCredentials = true
                        }
                    } else {
                        isInvalidCredentials = true
                    }
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
                }).frame(maxHeight: 75).padding().padding()
                if isInvalidCredentials {
                    Text("Invalid username or password")
                        .fontDesign(.rounded)
                        .foregroundColor(.red)
                        .padding(.top, height * 0.02)
                }
                Button(action: {
                    isRegister = true
                }) {
                    Text("Don't have an account? Register")
                        .fontDesign(.rounded)
                        .font(.system(size: width * 0.05, weight: .bold))
                        .frame(width: width * 0.8, height: height * 0.1)
                        .foregroundColor(Color("darkBlue"))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal, width * 0.1)
                .sheet(isPresented: $isRegister) {
                    childRegister()
                }
            }
            .fullScreenCover(isPresented: $isLoggedIn) {
                childContentView()
            }
            .preferredColorScheme(.light)
            .onAppear {
                model.load()

                
                DispatchQueue.main.async {
                    pv.username = model.myUsers.last?.username ?? ""
                    pv.password = model.myUsers.last?.password ?? ""
                }
            }
        }.background(Color("lightBlue"))
    }
}

struct childLogin_Previews: PreviewProvider {
    static var previews: some View {
        let pv = PV() // Create a mock instance of PV

        return childLogin()
            .environmentObject(pv) // Inject the mock instance as an environment object
    }
}
