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
                                        
                                            if isSelected {
                                                selectedParks.remove(name)
                                            } else {
                                                selectedParks.insert(name)
                                            }
                                        }) {
                                            Text(name)
                                                .font(.system(size: width * 0.05, weight: .bold))
                                                .foregroundColor(selectedParks.contains(name) ? .green : .white)
                                                .padding(.top, 25)
                                                .padding(.bottom, 25)
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
                        if model.myUsers.last?.lastName == "" { // if not logged in
                            showGuestHome = true
                        } else {
                            showHome = true
                        }
                    })
                    .foregroundColor(Color("navyBlue"))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .background(Color("lightningYellow"))
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
