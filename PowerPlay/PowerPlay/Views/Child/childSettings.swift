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
                        ChildMascot(childViewData: ChildViewData(), size: 0.1, isHomePage: false)
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
                    }.padding(.leading, 30)
                    .padding(.trailing, 30)
                    .multilineTextAlignment(.leading)
                    Divider()
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
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
                        }
                    }.padding(.leading, 30)
                        .padding(.trailing, 30)
                        .multilineTextAlignment(.leading)
                    Divider()
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
                    HStack {
                        Text("Parks")
                            .fontDesign(.rounded)
                            .font(.title2)
                            .foregroundColor(Color("darkBlue"))
                            .bold()
                            .padding()
                        Spacer() // Add a Spacer to push VStack to the right
                        VStack(alignment: .trailing, spacing: 8) { // Align VStack content to the left
                            ForEach(model.myParks) { park in
                                Text(park.parkName ?? "")
                                    .fontDesign(.rounded)
                                    .font(.title3)
                                    .frame(minWidth: 0, alignment: .leading) // Ensure all Text elements start on the same vertical axis
                            }
                        }.padding(.trailing, 30)
                    }.padding(.leading, 30)
                      
                      .multilineTextAlignment(.leading)

                    Divider()
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
                    
                    Toggle("Lesson Dictation", isOn: $childData.isToggleOn)
                        .fontDesign(.rounded)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title2)
                        .foregroundColor(Color("darkBlue"))
                        .padding()
                        .bold()
                        .onTapGesture {
                            print(childData.isToggleOn)
                        }
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                    

                }
                
                
               Spacer()
                
                Button {
                    model.deleteAllEntitiesData()
                    isLogout = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 7)
                            .padding()
                            .frame(minHeight: 80)
                            .foregroundColor(Color("dropShadowBlue"))
                        RoundedRectangle(cornerRadius: 7)
                            .padding()
                            .padding([.bottom], 6)
                            .frame(minHeight: 90)
                            .foregroundColor(Color("darkBlue"))
                            .overlay{
                                Text("LOGOUT")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.heavy)
                                    .fontDesign(.rounded)
                                    .font(.title2)
                            }
                    }
                }.padding(.horizontal)
                    .padding(.top)
                
                
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
                .padding(.horizontal)
                .padding(.bottom)
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
