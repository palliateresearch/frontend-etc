import SwiftUI

struct Settings: View {
    var model = TestModel()
    @State var isLogout = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Settings")
                        .fontDesign(.rounded)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack {
                        Image("personfillyellow")
                            .scaleEffect(0.3)
                            .foregroundColor(Color("lightningYellow"))
                            .frame(width: 300, height: 150)
                            .aspectRatio(contentMode: .fit)
                        Text("\(model.myUser?.firstName ?? "") \(model.myUser?.lastName ?? "")")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.title2)
                            .bold()
                            .padding()
                    }
                }
                VStack {
                    HStack {
                        Text("Account Type")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3)
                            .foregroundColor(Color("lightningYellow"))
                            .padding()
                        Text(model.myUser?.isParent ?? false ? "Parent" : "Child")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.title3)
                            .padding()
                    }
                    HStack {
                        Text("Username")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3)
                            .foregroundColor(Color("lightningYellow"))
                            .padding()
                        Text(model.myUser?.username ?? "")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.title3)
                            .padding()
                    }
                    HStack {
                        Text("Park")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3)
                            .foregroundColor(Color("lightningYellow"))
                            .padding()
                        Text(model.myUser?.park ?? "")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.title3)
                            .padding()
                    }
                    HStack {
                        Text("Children")
                            .fontDesign(.rounded)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .font(.title3)
                            .foregroundColor(Color("lightningYellow"))
                            .padding()
                        
                        VStack(alignment: .trailing, spacing: 8) {
                            ForEach(model.myChildren) { child in
                                Text(child.childName ?? "")
                                    .fontDesign(.rounded)
                                    .font(.title3)
                            }
                        }
                    }
                }
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                Button {
                    isLogout = true
                } label: {
                    Text("Logout")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            .background(Color("darkModeBackground"))
            .foregroundColor(Color.white)
        }
        .fullScreenCover(isPresented: $isLogout) {
            StartView()
                .background(Color("darkModeBackground"))
        }.padding()
        .background(Color("darkModeBackground"))
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        let model = TestModel() // Initialize your TestModel here with sample data if needed
        Settings(model: model)
    }
}
