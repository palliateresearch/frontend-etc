import SwiftUI

struct EnterChildren: View {
    @ObservedObject var userData = UserData()
    @State private var lenChildren: Int = 0
    @State private var current: Int = 0
    @State private var isSubmitted = false
    @State private var isPark = false
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            VStack(spacing: 0) {
                // Add Children Header
                Text("Add Children")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                   
                    .foregroundColor(Color.white)
                
                HStack {
                    Spacer()
                    Button(action: {
                        // Add a child
                        lenChildren += 1
                        userData.children.append("")
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 24))
                            .foregroundColor(Color("lightningYellow"))
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 16)
                }
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(0..<lenChildren, id: \.self) { num in
                            ChildView(removeAction: {
                                // Remove the child
                                userData.children.remove(at: num)
                                lenChildren -= 1
                                
                            }, text: Binding(
                                get: {
                                    userData.children.indices.contains(num) ? userData.children[num] : ""
                                },
                                set: {
                                    if userData.children.indices.contains(num) {
                                        userData.children[num] = $0
                                    } else {
                                        userData.children.append($0)
                                    }
                                }
                            )).padding(.top, geometry.size.height * 0.1)
                        }
                    }
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity)
                }
                
                Button(action: {
                   isPark = true
                }){
                    Text("Submit")
                        .font(.system(size: width * 0.06, weight: .bold))
                        .frame(width: width * 0.5, height: height * 0.075)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .opacity(0.8)
                        .cornerRadius(10)
                }.padding(.top, height * 0.06)
                
            }
            .preferredColorScheme(.dark)
            
        }
        .fullScreenCover(isPresented: $isPark) {
            FindPark(userData: userData)
        }
    }
}


struct ChildView: View {
    var removeAction: () -> Void
    @Binding var text: String
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color("navyBlue"))
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.15)
                    .overlay(
                        TextField("Enter child's name", text: $text)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(Color.white)
                        
                    )
                
                Spacer()
                
                Button(action: {
                    removeAction()
                }) {
                    Image(systemName: "minus.circle")
                        .font(.system(size: 24))
                        .foregroundColor(Color("lightningYellow"))
                }
            }.padding()
        }
    }
}
