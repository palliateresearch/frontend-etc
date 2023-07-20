import SwiftUI

struct EnterChildren: View {
    @ObservedObject var userData: UserViewData
    @State private var isPark = false

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            VStack(spacing: 0) {
                Text("Add Children")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)

                HStack {
                    Spacer()
                    Button(action: {
                        userData.children.append("")
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 24))
                            .foregroundColor(Color("lightningYellow"))
                    }
                    .padding(.trailing, width * 0.05)
                    .padding(.top, height * 0.1)
                    .padding(.bottom, height * 0.1)
                }

                ScrollView {
                   VStack(spacing: 0) { // Wrap the VStack with a divider
                       ForEach(userData.children.indices, id: \.self) { index in
                           ChildView(removeAction: {
                               userData.children.remove(at: index)
                           }, child: Binding(
                               get: {
                                   userData.children.indices.contains(index) ? userData.children[index] : ""
                               },
                               set: {
                                   if userData.children.indices.contains(index) {
                                       userData.children[index] = $0
                                   } else {
                                       userData.children.append($0)
                                   }
                               }
                           ))
                           .padding(.top, geometry.size.height * 0.05)

                           if index != userData.children.count - 1 { // Add divider unless it's the last child
                               Divider()
                                   .background(Color.gray)
                                   .padding(.horizontal, geometry.size.width * 0.05)
                                   .padding(.top, height * 0.075)
                           }
                       }
                   }
                   .frame(maxWidth: .infinity)
                }

                Button(action: {
                    isPark = true
                }) {
                    Text("Submit")
                        .font(.system(size: width * 0.06, weight: .bold))
                        .frame(width: width * 0.5, height: height * 0.075)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .opacity(0.8)
                        .cornerRadius(10)
                }
                .padding(.top, height * 0.04)
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
    @Binding var child: String

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let spacing = width * 0.01

            HStack {
                ZStack {
                   
                    TextField("Child Username", text: self.$child)
                        .padding(.horizontal, width * 0.05)
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
            }
            .padding(.horizontal, spacing)
        }
    }
}

struct EnterChildren_Previews: PreviewProvider {
    static var previews: some View {
        EnterChildren(userData: UserViewData()).environment(\.colorScheme, .dark)
    }
}
