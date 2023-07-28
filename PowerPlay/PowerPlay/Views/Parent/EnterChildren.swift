import SwiftUI
import CoreData
import Charts

struct EnterChildren: View {
    @EnvironmentObject private var pv: PV
    var model = TestModel()
    var thing: String

    @State private var isSubmit = false

    private func userHasParksData(_ user: User) -> Bool {
        if let parks = user.parks, !parks.isEmpty {
            return true
        }
        return false
    }

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
                        pv.childrenNames.append("")
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
                    VStack(spacing: 0) {
                      
                            ForEach(pv.childrenNames.indices, id: \.self) { index in
                                ChildView(removeAction: {
                                    pv.childrenNames.remove(at: index)
                                }, child: Binding(
                                    get: {
                                        pv.childrenNames.indices.contains(index) ? pv.childrenNames[index] : ""
                                    },
                                    set: {
                                        if pv.childrenNames.indices.contains(index) {
                                            pv.childrenNames[index] = $0
                                        } else {
                                            pv.childrenNames.append($0)
                                        }
                                    }
                                ))
                                .padding(.top, geometry.size.height * 0.05)

                                if index != pv.childrenNames.count - 1 {
                                    Divider()
                                        .background(Color.white)
                                        .padding(.horizontal, geometry.size.width * 0.05)
                                        .padding(.top, height * 0.075)
                                }
                            }
                        
            
                    }
                    .frame(maxWidth: .infinity)
                }

                Button(action: {
                    pv.isParent = true
                        pv.childrenNames = Array(Set(pv.childrenNames))
                        isSubmit = true
                        registerChildren()
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
            .fullScreenCover(isPresented: $isSubmit) {
                if let user = model.myUsers.last, userHasParksData(user) {
                    ContentView()
                } else {
                    FindPark()
                }
            }
            
            .onAppear {
                print("pv.childrenNames:", pv.childrenNames)
            }
            .onChange(of: pv.childrenNames) { newValue in
                print("pv.childrenNames changed:", newValue)
            }
        }
    }

    private func registerChildren() {
        for childName in pv.childrenNames {
            
            let child = model.createChild()
            child.childName = childName
        }
//        model.save()
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
                        .font(.system(size: 20))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
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
        EnterChildren(thing: "itself").environmentObject(PV())
    }
}
