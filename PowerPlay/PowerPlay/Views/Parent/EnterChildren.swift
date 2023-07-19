import SwiftUI

struct EnterChildren: View {
    
    @ObservedObject var userData = UserViewData()
    
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
                    .padding(.trailing, width * 0.05)
                    .padding(.top, 16)
                }
                
                ScrollView {
                    VStack() {
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
    @State private var isEditing: Bool = false

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let boxWidth = width * 0.8
            let boxHeight = height * 8
            let spacing = width * 0.01
          
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color("navyBlue"))
                        .frame(width: boxWidth, height: boxHeight)
                        .onTapGesture {
                            isEditing.toggle() // Toggle the isEditing state on tap
                        }

                    if isEditing {
                        TextField("", text: $text, onEditingChanged: { editing in
                            // This will be called when the editing begins and ends
                            if !editing {
                                isEditing = false // Set isEditing to false when editing is finished
                            }
                        })
                        .font(.system(size: width * 0.05, weight: .bold))
                        .padding(width * 0.03)
                        .foregroundColor(Color.white)
                    } else {
                        if text.isEmpty {
                            Text("Enter child's username")
                                .foregroundColor(Color.gray)
                                .font(.system(size: width * 0.05, weight: .bold))
                                .padding(width * 0.03)
                        } else {
                            Text(text)
                                .foregroundColor(Color.gray)
                                .font(.system(size: width * 0.05, weight: .bold))
                                .padding(width * 0.03)
                        }
                    }
                }

                Spacer()

                Button(action: {
                    removeAction()
                }) {
                    Image(systemName: "minus.circle")
                        .font(.system(size: width * 0.06))
                        .foregroundColor(Color("lightningYellow"))
                }
                .padding(.trailing, width * 0.045)
                .padding(.leading, width * 0.05)
                // Add padding between the minus sign and the box
            }
            .padding(.horizontal, spacing) // Add horizontal padding with the same spacing
        }
    }
}
