import SwiftUI

struct childSettings: View {
    @EnvironmentObject private var pv: PV
    var model = TestModel()
    @State var isLogout = false
    @ObservedObject var childData: ChildViewData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    childCustomNavBar(navTitle: "Settings", color: "darkBlue")
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    VStack {
//                        Image("Sparky")
//                            .scaleEffect(0.1)
//                            .frame(width: 200, height: 125)
//                            .aspectRatio(contentMode: .fit)
                        ChildMascot(emotion: "", size: 0.1)
                                .frame(maxWidth: .infinity, maxHeight: 125, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                        
                        if let firstName = model.myUsers.last?.firstName,
                           let lastName = model.myUsers.last?.lastName {
                            Text("\(firstName) \(lastName)")
                                .fontDesign(.rounded)
                                .foregroundColor(Color("darkBlue"))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.system(size: 30))
                                .fontWeight(.heavy)
                                .padding()
                        }
                    }
                }
                
                VStack {
                    HStack {
                        Text("Account Type")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .foregroundColor(Color("darkBlue"))
                            .padding()
                            .bold()
                        Text("Child")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.title2)
                            .padding()
                            .foregroundColor(Color.black)
                            .padding(.trailing, 50)
                    }
                    HStack {
                        Text("Username")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .foregroundColor(Color("darkBlue"))
                            .bold()
                            .padding()
                        
                        if let userName = model.myUsers.last?.username {
                            Text(userName)
                                .fontDesign(.rounded)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.title2)
                                .padding()
                                .foregroundColor(Color.black)
                                .padding(.trailing, 50)
                        }
                    }
                    HStack {
                        Text("Parks")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .foregroundColor(Color("darkBlue"))
                            .padding()
                            .bold()
                        
                        Spacer()
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            VStack {
                                VStack(alignment: .trailing, spacing: 5) {
                                    ForEach(model.myParks) { park in
                                        Text(park.parkName ?? "default park")
                                            .fontDesign(.rounded)
                                            .font(.title2)
                                            .padding(.trailing)
                                            .foregroundColor(Color.black)
                                    }
                                }
                                
                            }
                        }
                        .frame(width: 200, height: 200)
                        .padding()
                    }
                    
                    Toggle("Toggle Example", isOn: $childData.isToggleOn)
                        .fontDesign(.rounded)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2)
                        .foregroundColor(Color("darkBlue"))
                        .padding()
                        .bold()
                        .onTapGesture {
                            print(childData.isToggleOn)
                        }
                    

                }
                
                
                
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                Button {
                    model.deleteAllEntitiesData()
                    isLogout = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 7)
                            .padding()
                            .frame(minHeight: 80)
                            .foregroundColor(Color("dropShadowLogoutRed"))
                        RoundedRectangle(cornerRadius: 7)
                            .padding()
                            .padding([.bottom], 6)
                            .frame(minHeight: 90)
                            .foregroundColor(Color("logoutRed"))
                            .overlay{
                                Text("DELETE ACCOUNT")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.heavy)
                                    .fontDesign(.rounded)
                                    .font(.title2)
                            }
                    }
                }
                .padding([.bottom], 70)
                .padding()
            }
            .fullScreenCover(isPresented: $isLogout) {
                childStartView()
            }
            .background(Color("lightBlue"))
        }
    }
}

//struct childSettings_Previews: PreviewProvider {
//    static var previews: some View {
//        let pv = PV() // Create a mock instance of PV
//
//        return childSettings()
//            .environmentObject(pv) // Inject the mock instance as an environment object
//    }
//}
