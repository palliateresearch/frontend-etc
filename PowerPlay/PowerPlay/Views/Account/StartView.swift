import SwiftUI


struct StartView: View {
    @State private var powerBandHovered = false
    @State private var scanPowerBandHovered = false
    @State private var loginAsGuestHovered = false
    @State private var loginViewActive = false
    @State private var registerViewAction = false
    @State private var guestViewActive = false
    @State private var isChildActive = false
    
    @EnvironmentObject var pv: PV
    
    @ObservedObject var userData = UserViewData()
    var model = TestModel()


    
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                let height = geometry.size.height * 0.07
                let width = geometry.size.height * 0.5 // not rly width just a random var
                let x = geometry.size.width * 0.85
                VStack(spacing: 0) {
                    
                    HStack {
                        Spacer()
                        
                        Text("Welcome  to")
                            .fontDesign(.rounded)
                            .font(.system(size: width * 0.09, weight: .bold))
                            .frame(width: width * 0.8)
                        
                        Spacer()
                    }
                    .padding(.top, UIScreen.main.bounds.height * 0.12)
                    
                    HStack {
                        Spacer()
                        
                        Image("palliateIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width * 0.45)
                            .padding(.bottom, 10)
                        
                        Spacer()
                    }.padding(.top, width * 0.04)
                    
                    
                    
                    HStack {
                        Spacer()
                        
                        Text("PowerPlay")
                            .fontDesign(.rounded)
                            .font(.system(size: width * 0.135, weight: .bold))
                            .frame(width: width * 0.8)
                        
                        Spacer()
                    }.padding(.top, width * 0.04)
                    
                    VStack {
                        Spacer()
                        
                        Button(action: {
                            loginViewActive = true
                        }) {
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color("navyBlue"))
                                    .frame(width: x, height: height, alignment: .center)
                                    .padding(.bottom, width * 0.05)
                                    .padding(.top, width * 0.12)
                                    .scaleEffect(powerBandHovered ? 1.1 : 1.0)
                                    .animation(.easeIn, value: powerBandHovered)
                                    
                                    
                                
                                Text("Login")
                                    .fontDesign(.rounded)
                                    .font(.system(size: width * 0.06, weight: .bold))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, width * 0.05)
                                    .padding(.top, width * 0.12)
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: {
                            registerViewAction = true
                            
                        }) {
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color("navyBlue"))
                                    .frame(width: x, height: height, alignment: .center)
                                    .padding(.bottom, width * 0.05)
                                    .scaleEffect(scanPowerBandHovered ? 1.1 : 1.0)
                                    .onHover { hover in
                                        scanPowerBandHovered = hover
                                    }
                                
                                Text("Register")
                                    .fontDesign(.rounded)
                                    .font(.system(size: width * 0.06, weight: .bold))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, width * 0.05)
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: {
                            guestViewActive = true
                        }) {
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color("lightningYellow"))
                                    .frame(width: x, height: height, alignment: .center)
                                    .padding(.bottom, width * 0.07)
                                    .scaleEffect(loginAsGuestHovered ? 1.1 : 1.0)
                                    .onHover { hover in
                                        loginAsGuestHovered = hover
                                    }
                                
                                Text("Login as Guest")
                                    .fontDesign(.rounded)
                                    .font(.system(size: width * 0.06, weight: .bold))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, width * 0.07)
                                    .foregroundColor(.black)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                    }
                    
                    Button(action: {
                        pv.isParent = false
                        model.myUsers.last?.isParent = pv.isParent
                        model.save()
                        isChildActive = true
                        
                    }) {
                        Text("Are you a child?")
                            .fontDesign(.rounded)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(Color("lightningYellow"))
                            .underline()
                            .padding(.bottom, 30)
                    }
                    .padding(.horizontal)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
              
                .foregroundColor(Color.white)
                .padding()
                .background(Color("darkModeBackground"))
                .edgesIgnoringSafeArea(.all)
               
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $loginViewActive) {
                Login()
        }
        .fullScreenCover(isPresented: $registerViewAction) {
                Register()
        }
        .fullScreenCover(isPresented: $guestViewActive) {
                FindPark()
        }
        .fullScreenCover(isPresented: $isChildActive) {
                childStartView()
        }
        .onAppear {
            pv.resetMaxPV()
            pv.printAll()
        }
    }
    
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

