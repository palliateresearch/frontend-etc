import SwiftUI
import CoreData

struct FindPark: View {
    var model = TestModel()
    var p = parkList()

    @State private var searchText = ""
    @State private var showGuestHome = false
    @State private var showHome = false
    @State private var selectedParks: Set<String> = []
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                let width = geo.size.width
                VStack {
                    Text("Find Your Parks")
                        .font(.system(size: width * 0.09, weight: .bold))
                        .frame(width: width * 0.8)
                        .padding(.top, 50)

                   
                    
                    NavigationStack {
                        VStack {
                            List {
                                ForEach(searchResults, id: \.self) { name in
                                    if model.myParks.firstIndex(where: { $0.parkName == name }) == nil {
                                        Button(action: {
                                            let newPark = model.createPark()
                                            newPark.parkName = String(name)
                                            model.save()
                                            
                                          
                                            let isSelected = selectedParks.contains(name)
                                        

                                        print(String(name))
                                        print("Park name: \n\n\n\n\n\n")
                                        

                                        if selectedParks.contains(name) {
                                            selectedParks.remove(name)
                                            
                                            
                                        } else {
                                            let newPark = model.createPark()
                                            newPark.parkName = String(name)
                                            model.save()
                                            selectedParks.insert(name)
                                        }
                                        .disabled(selectedParks.contains(name))
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
                    
                    // Submit Button
                    Button("Submit", action: {
                        model.save()
                        if model.myUsers.last?.lastName == "" || model.myUsers.last?.lastName == nil { // if not logged in
                            showGuestHome = true
                        } else {
                            showHome = true
                        }
                    })
                    .font(.system(size: width * 0.06, weight: .bold))
                    .foregroundColor(Color.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.top, 20)
                }
                .fullScreenCover(isPresented: $showGuestHome) {
                    GuestHome()
                }

                .fullScreenCover(isPresented: $showHome) {
                    if (model.myUsers.last?.isParent) == true {
                        ContentView()
                    } else {
                        childContentView()
                    }
                }
            }
        }
        .onAppear {
            model.load()
            model.deleteParkEntitiesData()
            model.save()
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
