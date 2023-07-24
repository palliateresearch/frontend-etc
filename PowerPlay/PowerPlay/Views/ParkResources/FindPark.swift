import SwiftUI
import CoreData

struct FindPark: View {
    var model = TestModel()
    var p = parkList()

    @State private var searchText = ""
    @State private var showGuestHome = false
    @State private var showHome = false
    @State private var isSelected = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                let width = geo.size.width
                VStack {
                    Text("Find Your Park")
                        .font(.system(size: width * 0.09, weight: .bold))
                        .frame(width: width * 0.8)
                        .padding(.top, 50)

                    NavigationStack {
                        VStack {
                            List {
                                ForEach(searchResults, id: \.self) { name in
                                    Button(action: {
                                        if model.myUser?.firstName == "" { // if not logged in
                                            showGuestHome = true
                                        } else {
                                            showHome = true
                                        }
                                        model.myUser?.parks?.append(String(name))
                                        model.save()
                                    }) {
                                        Text(name)
                                            .font(.system(size: width * 0.05, weight: .bold))
                                            .foregroundColor(.white)
                                            .padding(.top, 25)
                                            .padding(.bottom, 25)
                                    }
                                }
                            }
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss() // Dismiss the current view
                            }) {
                                Image(systemName: "chevron.left")
                                    .font(.title)
                            }
                        }
                    }

                    .searchable(text: $searchText)
                    .preferredColorScheme(.dark)
                }
                .fullScreenCover(isPresented: $showGuestHome) {
                    GuestHome()
                }

                .fullScreenCover(isPresented: $showHome) {
                   
                    if((model.myUser?.isParent) != nil){
                        ContentView()
                    } else {
                        childContentView()
                    }
                   
                }
            }
        }
        .onAppear{
            model.load()
        }
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return p.names
        } else {
            return p.names.filter { $0.contains(searchText) }
        }
    }
}
struct FindPark_Previews: PreviewProvider {
    static var previews: some View {
        let pv = PV() // Create a mock instance of PV

        return FindPark()
            .environmentObject(pv) // Inject the mock instance as an environment object
    }
}



